Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585BEC27C7C
	for <soc@archiver.kernel.org>; Mon, 20 Feb 2023 19:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BCC8C4339E; Mon, 20 Feb 2023 19:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC6EC4339B;
	Mon, 20 Feb 2023 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676920214;
	bh=cc8eqg+4A8DrgKVsHakb4bNUomjCzfoXysiDEAYMYQA=;
	h=From:Date:Subject:List-Id:To:Cc:From;
	b=V5XxwBRoJyQFlqoZHuqqEK1WSCsYoRzKaTpT1tXZdJeYnASoAX/ECy/EqQJ/3ycVD
	 qqy52OP0EdjK+rx6ooEeVOMeEh/q6W7NyUTwfa6h/II6kbPH4z2H5oUCDB/CJ3m1qs
	 /0y+De+ODeUKmMxH5MwVz7aQ3iCOnuIaw9CoTT3tmWcOVGD7aeV1IyiTBCBP5b/H8r
	 ee2hiS0Vul8sRQHBdcy7BNyg9uLLdIOIXeykzgi1/li2/ADKfsass8hJ10mKKRsgj8
	 zMp4ikCBwNebAkkTXmNU5sEHiRomcSj3IIDHP6BPic++PohRN63Kjl8dnIE+dkn4eb
	 4/P+T0wEqsang==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Feb 2023 19:09:45 +0000
Subject: [PATCH] arm64: defconfig: Fix unintentional disablement of PCI on
 i.MX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230220-imx-pci-defconfig-v1-1-2210cf08340e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHjF82MC/x2NQQqDMBAAvyJ7diHdHJr2K8XDJm50D8aQiAji3
 409zsAwJ1QpKhW+3QlFdq26pgavvoMwc5oEdWwMZMgaIoO6HJiD4igxrCnqhI4tk7P+/XEMrfN
 cBX3hFOan3Jb82Fwk6vE//YbrugFtt+/jeQAAAA==
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, soc@kernel.org, 
 Richard Zhu <hongxing.zhu@nxp.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Walle <michael@walle.cc>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "kernelci.org bot" <bot@kernelci.org>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cc8eqg+4A8DrgKVsHakb4bNUomjCzfoXysiDEAYMYQA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj88WQ20XefWLXEIdOOb/burWu9hJVVqtxrmfxNtx6
 2giFY8qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/PFkAAKCRAk1otyXVSH0OSPB/
 96Ip13HogsZEME5StCBeqYX+dxWB+c3AFRiUwWuZ8WKHTGvTmshXSQR3LsBweMO9xD2KOJ/liv5Yzv
 YSKm7Y3eVdQIDZGUdkEX3J7XXHxhu1X3o/K4KisR2B+7IHPehMCi41JNtXEhYqUwym8Ck6OlS8NNRX
 HC1wXrC482pJm5EF4OqNZKlsQxk45nVL7YyFSj25Gqvxu5hfG8iBDW1k0Q2cZFlrrWSsWLGqUYj1rW
 tmIt+yJhAb4j1fKhGyJHFe8LJYYSFAZ9CwrA5ErRfdZu4cPbgOpEcn0HkMM+HQ6/4TT8Kt/mgi1tF3
 mBZEOXLaWpbaTzbd0mRMJm8ouDmxGO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

A recent update to support PCI endpoint mode on i.MX platforms
unintentionally disabled PCI host support for i.MX in defconfig.  The
existing PCI_IMX6 was made a hidden option, selected by new options
PCI_IMX6_HOST (for the existing support) and PCI_IMX6_EP (for the
endpoint mode), but there has been no corresponding update to defconfig
so the PCI_IMX6 ends up getting disabled.  Switch defconfig to
PCI_IMX6_HOST to preserve the existing functionality.

Fixes: 75c2f26da03f ("PCI: imx6: Add i.MX PCIe EP mode support")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b452d8d7a32c..36f5c9ecc871 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -219,7 +219,7 @@ CONFIG_PCI_HOST_THUNDER_ECAM=y
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCIE_BRCMSTB=m
-CONFIG_PCI_IMX6=y
+CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
 CONFIG_PCIE_QCOM=y

---
base-commit: d2af0fa4bfa4ec29d03b449ccd43fee39501112d
change-id: 20230220-imx-pci-defconfig-8a3a283b798a

Best regards,
-- 
Mark Brown <broonie@kernel.org>

