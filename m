Return-Path: <SRS0=ge7R=O4=gmail.com=zhang.lyra@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C30C433F5
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 03:45:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E0C0961027; Fri,  8 Oct 2021 03:45:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B64E360FC3;
	Fri,  8 Oct 2021 03:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B64E360FC3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id y5so5310972pll.3;
        Thu, 07 Oct 2021 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hX9WiA94/+jITIvegMFY+BuTehbQ371zzW5Ogx2JYVE=;
        b=PstNJ6j+e+spvgvj/PM3BNyz6iThcz8hLiTZ8+8dPRItcTo8jpoS3i5D8fkk7DWGgU
         lfRHcOVpEYXRNZDQOktbeczSlRPGYRqn44Ifvs4DlCqo0I6BlxXObFR9bI0lc21wNqpZ
         ybDQ55HTvTTGgq4H1uF2OkLU6ziPjL5L5omzki6DZbNncYllPwVtfZiNzrz9O0dWO3Lv
         jRgUdKsM/+A0NdMiLyIB7+D3A5dbV6+8PvEdUYzlknoHks27YFaHfFHs0w8IyDK8G1in
         zX8r2R1X+krF6/NV1W5meykRiqtbggctfgyougL7nFrhaOWXmC7z6CjtpYlLeVU5NjE0
         NW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hX9WiA94/+jITIvegMFY+BuTehbQ371zzW5Ogx2JYVE=;
        b=BrMYsKkhiwZV9d1iz4gzLqybRri8tPbDTWS+a1ouO9/nmJib8L1CWfJXzhKyZnaRr6
         dFO/kk6yIrWci6f6LDRz9YII8pzW8VuSrgtTi4Bh+w0zHuJXbWISBoBLvZuyfDMRLvK7
         b66tZW4D4+OCpk+7ijwPccbTJ/QZhzTAJc7NJUe5aoQbku/BvHf5QjW2m1gxWTK2bhM1
         LRP/CBeyB821gesPuUolKthRFRxXDm2zXnaLhakcOQUkFIiH+DVsMyUfNgOYxgOM5xrI
         ZnqFG3DGEW4a5Boe3YrTlxM1a0pwgn49dIa1xYN8G9aUnhBtdMe45AhmRzOfS9JxTAeD
         V5mQ==
X-Gm-Message-State: AOAM530bccMZFmMOyWSigUGVzWzWcKv9gZ3Vwph/dY1/Ro9yb7mw4plu
	hx81rwPOkUT6KcHaXFDuEDSILUwow7s=
X-Google-Smtp-Source: ABdhPJwB+r1IpmlatcbsfmuqWj+ewWl15JdshFm3gch2kAxCjvlYZWE6/bMa9OLzG887MLO57o1khg==
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id h3-20020a170902f703b029012c0982c9aemr7593316plo.20.1633664756205;
        Thu, 07 Oct 2021 20:45:56 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id s3sm9253776pjr.1.2021.10.07.20.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 20:45:55 -0700 (PDT)
From: Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Baolin Wang <baolin.wang7@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chunyan Zhang <chunyan.zhang@unisoc.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add Unisoc's UMS512 support
Date: Fri,  8 Oct 2021 11:45:31 +0800
Message-Id: <20211008034533.343167-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Unisoc's UMS512 has Octa-core ARM Cortex A55 application processor.

Changes since v1:
* Renamed regulator node name and add required 'reg' property for it;
* Removed sprd-uart.yaml which got merged already;
* Added Rob's Acked-by for bindings changes.

Chunyan Zhang (2):
  dt-bindings: arm: Add bindings for Unisoc's UMS512
  arm64: dts: Add support for Unisoc's UMS512

 .../devicetree/bindings/arm/sprd/sprd.yaml    |   5 +
 arch/arm64/boot/dts/sprd/Makefile             |   3 +-
 arch/arm64/boot/dts/sprd/sc2730.dtsi          | 263 +++++
 arch/arm64/boot/dts/sprd/ums512-1h10.dts      |  69 ++
 arch/arm64/boot/dts/sprd/ums512.dtsi          | 919 ++++++++++++++++++
 5 files changed, 1258 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/sprd/sc2730.dtsi
 create mode 100644 arch/arm64/boot/dts/sprd/ums512-1h10.dts
 create mode 100644 arch/arm64/boot/dts/sprd/ums512.dtsi

-- 
2.25.1

