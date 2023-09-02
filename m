Return-Path: <SRS0=fh0W=ES=loongson.cn=zhoubinbin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D04CA0FFF
	for <soc@archiver.kernel.org>; Sat,  2 Sep 2023 08:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72D76C116A2; Sat,  2 Sep 2023 08:47:46 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 366C5C433C7;
	Sat,  2 Sep 2023 08:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 366C5C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8CxfOqr9vJkyP4dAA--.34218S3;
	Sat, 02 Sep 2023 16:47:39 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrM6n9vJkZY1pAA--.58262S3;
	Sat, 02 Sep 2023 16:47:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 1/5] soc: loongson: loongson2_pm: Add dependency for INPUT
Date: Sat,  2 Sep 2023 16:47:27 +0800
Message-Id: <16a37f6ad3cc9417b6638c2cd532d88c79468eb1.1693623752.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1693623752.git.zhoubinbin@loongson.cn>
References: <cover.1693623752.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxrM6n9vJkZY1pAA--.58262S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4fJw1kXFWUKw17ZrWUtrc_yoW5Gw13pa
	savr97KrWUXrW5Zrn8J34UuFy5ZF97X3sIga9rG345WF9rAa4ku3ZrJFyfZFsrZryvvFW0
	vry8GrW5uasrGrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

Since commit 67694c076bd7 ("soc: loongson2_pm: add power management
support"), the Loongson-2K PM driver was added, but it didn't update the
Kconfig entry for the INPUT dependency, leading to build errors:

/opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-ld:
drivers/soc/loongson/loongson2_pm.o: in function `loongson2_power_button_init':
/work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongson2_pm.c:101:(.text+0x350): undefined reference to `input_allocate_device'
/opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-ld:
/work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongson2_pm.c:109:(.text+0x3dc): undefined reference to `input_set_capability'
/opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-ld:
/work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongson2_pm.c:111:(.text+0x3e4): undefined reference to `input_register_device'
/opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-ld:
/work/lnx/next/linux-next-20230825/LOONG64/../drivers/soc/loongson/loongson2_pm.c:125:(.text+0x3fc): undefined reference to `input_free_device'
/opt/crosstool/gcc-13.2.0-nolibc/loongarch64-linux/bin/loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in function `input_report_key':
/work/lnx/next/linux-next-20230825/LOONG64/../include/linux/input.h:425:(.text+0x58c): undefined reference to `input_event'

Also, since this driver can only be built-in, it fails to link when the
INPUT is in a loadable module, so we should update the Kconfig entry to
depend on INPUT=y.

Fixes: 67694c076bd7 ("soc: loongson2_pm: add power management support")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/soc/loongson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/loongson/Kconfig b/drivers/soc/loongson/Kconfig
index 314e13bb3e01..368344943a93 100644
--- a/drivers/soc/loongson/Kconfig
+++ b/drivers/soc/loongson/Kconfig
@@ -20,6 +20,7 @@ config LOONGSON2_GUTS
 config LOONGSON2_PM
 	bool "Loongson-2 SoC Power Management Controller Driver"
 	depends on LOONGARCH && OF
+	depends on INPUT=y
 	help
 	  The Loongson-2's power management controller was ACPI, supports ACPI
 	  S2Idle (Suspend To Idle), ACPI S3 (Suspend To RAM), ACPI S4 (Suspend To
-- 
2.39.3

