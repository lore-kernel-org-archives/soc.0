Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B304FC636D4
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 19:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99601C4339E; Fri, 10 Feb 2023 19:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D623DC433D2;
	Fri, 10 Feb 2023 19:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676058858;
	bh=l3SnYhScyP0w2IEoSm+uQzDcKgPBoVHn/KNgGmkMT+A=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=YavdS9aHwVVmVN/BXlorvphLOSHUqUNOl8iDEF5XtbXcJa8M9uA5DylSFXOk8geXE
	 95tB1keOeMXIatMz7UaLzH+AxH7HewDsbrWaZoW0D2jLsTC/Jnlyn/WVMxZqzGM7p1
	 dXTh3jjjNaMSk92D63NobPQzdbb32PA+m0IkB9ZDmYB5SymCAXAkNtiuxWTA03QsVG
	 dZAYn500xKEWs19oiGps0TcQDxNb9+M6HyGq3zH6TxLSGxAODkZxbxZuMwp+Wd6a3q
	 qtzlnes2Xbjtxm8nCf7ZrQLb9MA5EhU8c3YK24nXSuxmAqg2PToAozxomsxpN/oHZy
	 1zvKpLY95HOBw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 10 Feb 2023 19:52:49 +0000
Subject: [PATCH 3/3] arm64: configs: Add virtconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-arm64-defconfigs-v1-3-cd0694a05f13@kernel.org>
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
In-Reply-To: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919; i=broonie@kernel.org;
 h=from:subject:message-id; bh=l3SnYhScyP0w2IEoSm+uQzDcKgPBoVHn/KNgGmkMT+A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj5qDb2uSfY5UNJVyqXOZ5UeR3fip41ItvlIfdHvV2
 MrM03ZGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY+ag2wAKCRAk1otyXVSH0G/VB/
 9ZNX04QDYQlHb40vyUIYWcyh6z/+q8zcl4iO7CypmORwCdluxVFTrVaEw7X4m0z/oWP5Gzw4HEtn3t
 wGa8LjLbK7DjlrC4ZOQbTs3u7EGJTTNFdNYZP7LU058U7UyY7VS4wClgA7bQdlAP4NGTDd0GCFDmNd
 ySLA+uSqY0YzdISIIDVd3wI35h3+KVN4YAXTXW48jhc8WJPAQoFZt2a4X1wCIFLvwdh6sc5aqWA99/
 NFwkQYPns0Do7yW0NNTEvWfOASglkKYG4BE/pUvBz6OYBdr+7QBADNHdkchX2vvcrXpKKPT8MoJDzd
 VBIDTXHSOxlkZC1yA3M0pyvNleAazy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Provide a slimline configuration intended to be booted on virtual
machines, with the goal of providing a light configuration which will
boot on and enable features available in mach-virt.  This is defined in
terms of the standard defconfig, with an additional virt.config fragment
which disables options unneeded in a virtual configuration.

As a first step we just disable all the ARCH_ configuration options,
disabling the build of all the SoC specific drivers.  This results in a
kernel that builds about 25% faster in my testing, if this approach
works for people we can add further options.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Makefile            |  6 ++++++
 arch/arm64/configs/virt.config | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index c33b5da95b4a..2d49aea0ff67 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -205,6 +205,12 @@ ifdef CONFIG_COMPAT_VDSO
 endif
 endif
 
+include $(srctree)/scripts/Makefile.defconf
+
+PHONY += virtconfig
+virtconfig:
+	$(call merge_into_defconfig_override,defconfig,virt)
+
 define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.config
new file mode 100644
index 000000000000..6ef0a739717f
--- /dev/null
+++ b/arch/arm64/configs/virt.config
@@ -0,0 +1,39 @@
+# CONFIG_ARCH_ACTIONS is not set
+# CONFIG_ARCH_SUNXI is not set
+# CONFIG_ARCH_ALPINE is not set
+# CONFIG_ARCH_APPLE is not set
+# CONFIG_ARCH_BCM is not set
+# CONFIG_ARCH_BCM2835 is not set
+# CONFIG_ARCH_BCMBCA is not set
+# CONFIG_ARCH_BCM_IPROC is not set
+# CONFIG_ARCH_BERLIN is not set
+# CONFIG_ARCH_BRCMSTB is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_K3 is not set
+# CONFIG_ARCH_LAYERSCAPE is not set
+# CONFIG_ARCH_LG1K is not set
+# CONFIG_ARCH_HISI is not set
+# CONFIG_ARCH_KEEMBAY is not set
+# CONFIG_ARCH_MEDIATEK is not set
+# CONFIG_ARCH_MESON is not set
+# CONFIG_ARCH_MVEBU is not set
+# CONFIG_ARCH_NXP is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_NPCM is not set
+# CONFIG_ARCH_QCOM is not set
+# CONFIG_ARCH_RENESAS is not set
+# CONFIG_ARCH_ROCKCHIP is not set
+# CONFIG_ARCH_S32 is not set
+# CONFIG_ARCH_SEATTLE is not set
+# CONFIG_ARCH_INTEL_SOCFPGA is not set
+# CONFIG_ARCH_SYNQUACER is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_TESLA_FSD is not set
+# CONFIG_ARCH_SPRD is not set
+# CONFIG_ARCH_THUNDER is not set
+# CONFIG_ARCH_THUNDER2 is not set
+# CONFIG_ARCH_UNIPHIER is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_VISCONTI is not set
+# CONFIG_ARCH_XGENE is not set
+# CONFIG_ARCH_ZYNQMP is not set

-- 
2.30.2

