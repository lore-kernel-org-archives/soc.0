Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B58C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62BC6C385B8; Tue, 17 May 2022 03:28:06 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9880C385AA;
	Tue, 17 May 2022 03:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9880C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id g3so12257782qtb.7;
        Mon, 16 May 2022 20:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiOS/vicLJE9WEdrThn5lA73QwzwDarAXYYuEpv/t38=;
        b=GuMx0QJi/BbGxrLNR4hmBCktzb41Mq+TaJIoAywcw04Q4n9DsyqDcJCiSaLMBdI98H
         6DjzvmHWxl7qEmkNyWUt1rvXi1+i63u8yhwhHpjQ9om1sYwhhvrrlBVOOdkHZGuBlGZG
         zBB6fh+ABSl8gI9mrBLGWaNbXMipgLjTRJQdTYUZECJnE5BodealkZ6gW/Cpei38/70c
         wQfgl/3rkIy4+2ftCi0O0QYqDLKb8jChQ1CcrFsh8PP0F9wRW+n/7tt7Ndn0/Y+et3Ah
         opDDNyi221eKuD1zTtE3n3BmODVzN1EZLqinUn0r3MpZuUIikrW77Dwadu4o2GWjCUpM
         1G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiOS/vicLJE9WEdrThn5lA73QwzwDarAXYYuEpv/t38=;
        b=A+YlgOdMCx9L9uO6YJGXL0pSSoWuC04eGUbXYCoaydX1e2tv2YteTq8+IA9P6rBWno
         b6wUPBEiiRa1CkJAWIuU/D9YPYm38hw/ZER3GkICot9eFZC6aaaIZw0X7dFMwf7B7A2q
         6FJZsUrpZ1kxUe4aFO6SXAZE9BYFGYvju8ZVab3ZQVg60zDB0+b2krSJSDtwE2bcrCLn
         ggRh/n/YcG3sio/6FnS6f4RBAEaZczizvgZz/xCQj+O/iMxUgFSUoK4UOR0Hi57FHPNb
         50xKIBKOxSIIaStXFQZfbWnj/x8hWk8bdh3bU5mBtvVfRj+qOOz2p77pq5xEh9w7rFDZ
         SINg==
X-Gm-Message-State: AOAM532B8Af4FNqMnKksaAici1kxmzFlxFXcFhrrpkonpS3VnPzhdDOL
	R1ZPiydMlBmlk8iy/dJmVTY=
X-Google-Smtp-Source: ABdhPJxR3c5z0LY1qU0bR9Pa1M/8Q1xSFiaiCoy7+ewpfV1USVKihC8anAZHWlBMI4XrlWc5bZdCWQ==
X-Received: by 2002:a05:622a:1982:b0:2f3:b7c1:4426 with SMTP id u2-20020a05622a198200b002f3b7c14426mr18008779qtc.347.1652758084760;
        Mon, 16 May 2022 20:28:04 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a19-20020a376613000000b006a098381abcsm7079535qkc.114.2022.05.16.20.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:28:04 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	dev@lynxeye.de,
	marcel.ziswiler@toradex.com,
	tharvey@gateworks.com,
	leoyang.li@nxp.com,
	sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com,
	Mr.Bossman075@gmail.com,
	clin@suse.com,
	giulio.benetti@benettiengineering.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 02/15] dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
Date: Mon, 16 May 2022 23:27:49 -0400
Message-Id: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the i.MXRT1170 and 1050 have the same GPT timer as "fsl,imx6dl-gpt"
Add i.MXRT to the compatible list.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
V1 -> V2:
 - Nothing done
V2 -> V3:
 - Nothing done
---
 Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index a4f51f46b7a1..716c6afcca1f 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -31,6 +31,8 @@ properties:
           - enum:
               - fsl,imx6sl-gpt
               - fsl,imx6sx-gpt
+              - fsl,imxrt1050-gpt
+              - fsl,imxrt1170-gpt
           - const: fsl,imx6dl-gpt
 
   reg:
-- 
2.36.1

