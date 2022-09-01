Return-Path: <SRS0=HV0T=ZE=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D320ECAAD3
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 18:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43930C433C1; Thu,  1 Sep 2022 18:33:51 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55082C433D6;
	Thu,  1 Sep 2022 18:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55082C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id cr9so14124828qtb.13;
        Thu, 01 Sep 2022 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xKw4P8rUJGfJ1IRQYdJ5k8rUl4OjlTJzuus/Ip46sKI=;
        b=YtM0VaDKMElA1TOmURomZsGvaDv/RfT4YnUMKoGo4l5v4r10ZQkpelL6ih1RYWUFgb
         hiZq8JR0Jjx5RbiLnXfnuOPgCUglfgmsGtjb5ynMvke04mZjpCFFyYeGX/yyLGyOaLVl
         y1VgZLo0ECMrIIbnF4N5pZ0mSl9RZJeBSzlSRuG0OUkWf1flDBg8vJL3P9/mHPLhVi9c
         pYO7yAxEo0HljoXiYfGWkSVOdtritmVzW0VYh5m9LmJfA+g9zdLLn0G9Y/N15pq69Orz
         yPFcZ08XteQrxN2ZnnGb8RUngQLrB/WKirqU1QgfFJVVCpny3a2F+y8O/K8AkN6aJZ0B
         21mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xKw4P8rUJGfJ1IRQYdJ5k8rUl4OjlTJzuus/Ip46sKI=;
        b=MwYHGybeZo/959UY4m1MfxeF8PH59hmOKLCUpImJbnJKDDQQT/sy85oLUy9xYHy+YI
         30RQKJMcCJTPB2me8H78yXt0UyKi9YxKP3sFGI43H4giRKypj394XP1tNfwooprJUSsl
         XIXC9AN4WHdpYTEgOi9VVQ7uP387puT5kUoXDd2DH68hoAcF1cv5/FKPB72j1/RxGcTi
         HnAqdYMsUhqD/hA6BRqfDbSwHB8BdG5wVic0KRX5Xv0aF7yquuQ4EDc4kJsqsPEELw2t
         sv3lg6NJGV3r2TPLy59ydVoTS0O+xAPkS5aw9jthK6tb8oozFc7Hc3fYguy7FHPqmZDY
         zpCg==
X-Gm-Message-State: ACgBeo28tKJuNwtHI8KKul9N8WG5sT1gfa57T2LRe7u7NzWxwYoY5ivT
	wq8ISf5ChHw6JSJ373ni4BQ=
X-Google-Smtp-Source: AA6agR6X08zzVh0bpzfhpbQ/suX+Lp6b/y7S04GPoRVpBzhuL2qzGVVVqa2/9E64KnFvJhjXn8zWXg==
X-Received: by 2002:ac8:5a14:0:b0:344:5660:6530 with SMTP id n20-20020ac85a14000000b0034456606530mr25011005qta.12.1662057229247;
        Thu, 01 Sep 2022 11:33:49 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u20-20020ac87514000000b00342e86b3bdasm10563343qtq.12.2022.09.01.11.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:33:48 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 01/10] dt-bindings: arm: imx: Add i.MXRT compatible Documentation
Date: Thu,  1 Sep 2022 14:33:34 -0400
Message-Id: <20220901183343.3188903-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently the imxrt1050 was added but the cpu compatible node wasn't
added. Add both i.MXRT1170 and 1050 compatibles to fsl.yaml.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V1 -> V2:
 - Swap order of soc's
V2 -> V3:
 - Nothing done
V3 -> V4:
 - Nothing done
V4 -> V5:
 - Nothing done
V5 -> V6:
 - Nothing done
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7431579ab0e8..03350dd1fc58 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1053,6 +1053,18 @@ properties:
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
           - const: fsl,imx93
 
+      - description: i.MXRT1050 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1050-evk         # i.MXRT1050 EVK Board
+          - const: fsl,imxrt1050
+
+      - description: i.MXRT1170 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
+          - const: fsl,imxrt1170
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.36.1

