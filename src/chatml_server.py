import runpy
import fastchat.model.model_adapter
from fastchat.conversation import Conversation, SeparatorStyle, register_conv_template, get_conv_template
from fastchat.model.model_adapter import BaseModelAdapter, register_model_adapter, model_adapters


class ChatMLAdapter(BaseModelAdapter):
    use_fast_tokenizer = False

    def match(self, model_path: str):
        return True

    def get_default_conv_template(self, model_path: str) -> Conversation:
        return get_conv_template("chatml")


def main():
    register_conv_template(
        Conversation(
            name="chatml",
            system_template="<|im_start|>system\n{system_message}",
            system_message="You are a helpful assistant.",
            roles=["<|im_start|>user", "<|im_start|>assistant"],
            sep_style=SeparatorStyle.CHATML,
            sep="<|im_end|>",
        )
    )
    fastchat.model.model_adapter.model_adapters = []
    register_model_adapter(ChatMLAdapter)

    runpy.run_module("vllm.entrypoints.openai.api_server", {}, "__main__")


if __name__ == '__main__':
    main()
