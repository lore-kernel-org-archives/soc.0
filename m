Return-Path: <SRS0=jEOm=TS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C94EC433EF
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 19:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3997EC340EF; Mon,  7 Mar 2022 19:48:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B520C340EB;
	Mon,  7 Mar 2022 19:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B520C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id e13so14982119plh.3;
        Mon, 07 Mar 2022 11:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g6RJN+5dUttx3KuTi642ll6UntFDamtkl6+g0jaoPOM=;
        b=PxIHM9xqShvhggkNdvHZN8zUwiGtDMBRY2pxxhw3qc92XZ+bJATIsxRCfU+IFbzPpJ
         V1VbFXIwiWLOjzwbVhh4FhsGYRl6fxktrfzV59dlNqkA+delLtnL/333BSjdK82cBVwA
         RztEtAnWM0QU8DYWYA7NqMIgYzWwv+NAY5jPWFrx0QnH/lMIeJNTH/eUEYc8h2cNUO3H
         EUXksmbKMWHD6U7UVHet8wZ9C6bVjFJg3OmExtokkMiklrgLFv5HQAZNpe+DqsFAu0ga
         K9Hkw6FJB685+LzcksnJN7VjotwKQvJBtM0MLM/lr1puOrlFpTRe1yz7IUB5vofKBotd
         yjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6RJN+5dUttx3KuTi642ll6UntFDamtkl6+g0jaoPOM=;
        b=h+XFUrYpyHcSxgiYqkeFY/ykOrPhMlQgdmeE9IsH5jd4qU3xhiMfXmYtPWN3dUC/Zg
         Jn8spknPdJnuQj+EL/h7zRRqCmf+l8aWgfvzGsMucSlrTVKjit21GIf922UJZeC2aMOO
         9voUpwyPmJQMAVJ+ajAC70qES5ZGoZzrdaFwLAEsPAHsDAvo88diLbD255mCJ0AtHEcA
         4jbQZe3Fl0eXa2wMfcwQbhmxcs0IPYF+O1l8XnispOt1ViZ5W/y8NL3CcDyw0DgqQ0dJ
         gN08V8Rs4oSwvZCIeYG81M09iA7uBoltFxBj2Z6YIxq2bBT9An2PP0aTNs4bP4zu2aCP
         3c9Q==
X-Gm-Message-State: AOAM531l9zNW9dZUyWUJ6lcoOk28130WZxwzh+6TyvBPbld2NlGFLS2h
	k2xWpim4Sk4E2t9108IFL5098Gzedho=
X-Google-Smtp-Source: ABdhPJwYliKGB2K80AT6pOKIxOXBFhHn4gYeKsVuF6SDDuXigPcXNuc0efYXnagTfLzpkM+U6pGmEg==
X-Received: by 2002:a17:90b:1e0a:b0:1bf:4d46:741c with SMTP id pg10-20020a17090b1e0a00b001bf4d46741cmr658863pjb.116.1646682504589;
        Mon, 07 Mar 2022 11:48:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s20-20020a056a00179400b004f709998d13sm4060092pfg.10.2022.03.07.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 11:48:24 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/4] Broadcom devicetree-arm64 changes for 5.18
Date: Mon,  7 Mar 2022 11:48:16 -0800
Message-Id: <20220307194817.3754107-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307194817.3754107-1-f.fainelli@gmail.com>
References: <20220307194817.3754107-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/devicetree-arm64

for you to fetch changes up to 66435063c5f31caa70ecadb3de4fe4d17b141b51:

  arm64: dts: stingray: Fix spi clock name (2022-03-07 11:18:11 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 5.18, please pull the following:

- Krzysztof aligns the PL330 DMA controller node name to the schema

- Rafal corrects the TWD (Timer/Watchdog) block, adds the watchdog node,
  I2C controller node and the pinctrl node for the 4908 SoC

- Kuldeep fixes the Northstar 2 SPI properties as well as the PL022 SPI
  controller clock names

- Frank fixes the SATA node names to conform to the AHCI controller
  schema

----------------------------------------------------------------
Frank Wunderlich (1):
      arm64: dts: broadcom: Fix sata nodename

Krzysztof Kozlowski (1):
      arm64: dts: broadcom: align pl330 node name with dtschema

Kuldeep Singh (3):
      arm64: dts: ns2: Fix spi-cpol and spi-cpha property
      arm64: dts: ns2: Fix spi clock name
      arm64: dts: stingray: Fix spi clock name

Rafał Miłecki (4):
      arm64: dts: broadcom: bcm4908: use proper TWD binding
      arm64: dts: broadcom: bcm4908: add pinctrl binding
      arm64: dts: broadcom: bcm4908: add watchdog block
      arm64: dts: broadcom: bcm4908: add I2C block

 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  | 161 ++++++++++++++++++++-
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |   8 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |   8 +-
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   6 +-
 4 files changed, 168 insertions(+), 15 deletions(-)
