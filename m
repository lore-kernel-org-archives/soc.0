Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC3BC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:30:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E91613E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55E91613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6iySEpKumntA710a+V7MBsRv9fnwM822RwGFl1bbz4Y=; b=hWC5A5s6HOSwon
	AHnHnrwl//SZ86S5toPPu0MST1zumi4w9ma20g3/ygRphylitq5VEgyPjNsi06nZC5DEBt5AD1M0h
	Uw0GTOaaUxo/bV45S996HeYkB+8FbSQDbNG9TM0ClbDCaXTxcO1quCPngXNlrqWRZxHU1Zhk3yf3a
	5FjKZn0H5iOmrB7PdaX4tmqFrtEMBPB1S1LXwgYB1yt/PbtfozIPjO2HZWe1Ve9PwPKlZSSzKQ+lf
	FQ1PHTlACVZ8alflo5yhNOp2J6y2N2bG1DmClwf2zEtL3X8f7QMJ3wgqbtpgQM87oROi/QoaI4Q5d
	MO1ZuG3eTKu5G/m+EUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrU63-002syh-3R; Thu, 10 Jun 2021 23:28:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrU5w-002sxH-Ot
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 23:28:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m18so4041172wrv.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 16:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NkHOILVMygEEoZYONCaDsk6m76wqea7EMgUYfwAkp6E=;
 b=AyrM6aYYpCk/W3IH4jtqrK0gdAw7TpdyWoH75b18wAoaCzycuAPB/OMesODG2n27Ak
 CJhmqFVk5R6G7f3zjKNhxwJvEeqTKVRhaNjSv2oHwSwzcLmMANt4ydOCjHqWDhPgCjQs
 qwYoIk+YNbxnj+/Ww8DLfV+gwj7y0KZD5oFvuo36CxEu8kwPKfdsCuvI4UU4vFk+OeoR
 Ij93lWV/1GQ94JZ+/TbrCxe2vQrhrZ4sfAvO/IvSqSpICf1n1iK3f7VoVeZPHCsgGSRO
 jFx74kMtQU5BaLC7+huYoNyI6c9N1alScZmUAyg0a9oYC50y+820qMlRIIPt6AuIa4YQ
 0nfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NkHOILVMygEEoZYONCaDsk6m76wqea7EMgUYfwAkp6E=;
 b=gbb+hWhRV74+rEf6rlJGXs+dUzTw1zrBiWFMyl+LaJZuE3RN4IBUJga53dx52tKHsw
 DKGzcZ2665RXrbOy9gazibGsQ8sResVsnwsIn9m7FMhHPEkduUYTECLkhSX3bzcCmZJC
 5nUxqa8LcmqkLVSUL0sF3qlnRAp0A9w4WeOoHg1fPchD43Q9ZRRZ5X66Ixf8NkHzmZdd
 PBpV4kbYuuAhAogU1c3sjO72snTdnnSr+o+apiiDyQVxVincco3DfIhE2CmZ9chPcDjq
 oJQVMRnE4iefLxexTOijWM9CNOftiCBwhN4KjEjq1llNvSx1FrBR7Sbho89SjyDgQ9Sh
 R71w==
X-Gm-Message-State: AOAM530JxOWZYpnmdQllr/aCQ1dk5lk/C4iJQCAdJWiBxWTVneKPj4hs
 6TLWAtNneyypGBiGr0WwXLGy1pM7CIE=
X-Google-Smtp-Source: ABdhPJypWTWUMZFBvZneUf16gGGhOmY/Vj3MErZvt8ucDJz8tXaOY9ccvLRmQnYzWdMk9kcOr9TuVA==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr754337wrn.127.1623367694702; 
 Thu, 10 Jun 2021 16:28:14 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id w13sm5478549wrc.31.2021.06.10.16.28.13
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 10 Jun 2021 16:28:14 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] ARM: dts: NSP: add Meraki MX64/MX65
Date: Fri, 11 Jun 2021 00:27:12 +0100
Message-ID: <20210610232727.1383117-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_162816_840605_9DB1931F 
X-CRM114-Status: GOOD (  11.59  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210610232712.PYQ1BQ3Cu6Pr34Jivh9GeOn9L_t4t79C7Mei-4aLSKA@z>

Changes from v1:
- add dtb entries to Makefile
- add bindings entries to brcm,nsp.yaml
- change naming to include Meraki name
- remove unnecessary portions, including pinctrl from meraki-mx6x-common
- add A0 variant for MX64

Matthew Hagan (5):
  dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
  ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
  ARM: dts: NSP: Add common bindings for MX64/MX65
  ARM: dts: NSP: Add DT files for Meraki MX64 series
  ARM: dts: NSP: Add DT files for Meraki MX65 series

 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml |   6 +
 arch/arm/boot/dts/Makefile                    |   6 +
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 298 ++++++++++++++++++
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 131 ++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 +++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 +
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  15 +
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  23 ++
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 148 +++++++++
 11 files changed, 765 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi

-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
