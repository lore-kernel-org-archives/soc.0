Return-Path: <SRS0=mcdX=EQ=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C5DC83F10
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 08:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8193C433C9; Thu, 31 Aug 2023 08:30:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D626FC433C8;
	Thu, 31 Aug 2023 08:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D626FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-565439b6b3fso386152a12.2;
        Thu, 31 Aug 2023 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693470624; x=1694075424; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMjIF994q3qSA6WWBgnks3eIIMa6B1Wh1e0XtMkE9qw=;
        b=NbxWBqcXuX4+H6S4UtXHMp1rnV3BkSBtJWcyHAqUCnh5yMTA6cpnmYFzbdArlgwd5u
         CSPo1rAAdOPUlzOAdS4eFvXY6fYqE3e0lx3Vj+FfrAQQ8Hf1vwtY+x3jOgKNgDOuqobI
         BGN/ZdXflEjzUk+0yEDt9sdRr3StXoqf4UXgs6y2SU7nE289ivhTNBUaqaLBAcbM6I8n
         MX+9R88QmF1A/jCZCGh2m4yfsVYsjpMK0wBRCWhMOJVG+UYY37VI+/QM/fQhjmMhwIbY
         CFBeFB90HDFdnrA3OyOxUI/AejJFSqtm6NPuLVbEpicE5wCe1Wcn0g+27IqXU5RQt+VH
         d2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693470624; x=1694075424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMjIF994q3qSA6WWBgnks3eIIMa6B1Wh1e0XtMkE9qw=;
        b=A3jx37ZjZzBCmtJRj5zjCf2H2/Ed8omWtXjSYfLTmjQ2+kxcxbDuD1ljODzUlX+nrM
         MCMbW8paFFxZEbHJWW3xlfdCS6N1ZiQwEFFwkkZf8tuFSJLaMVmhacKVpFiI2Qi0kfDG
         tlVkxmh0sRuRHWt+y/OPPKWZ6Te3kBpfKi5JvnVVHWRMlGj/8NnWovuQv5b02+vhA/Qe
         PKCRZVF6UAFitu0tQM8u8YRxgX0Kl0bUOslN7FBaJT3vfeWTIsjVmGrKfO1pHc50G/JN
         TktJP3hsBgkxn7sZYkrlYJ97tdcsWmOmaWD+njGlJcwpEj3RdqnJEK5mIoTbptqT/O/G
         M8vA==
X-Gm-Message-State: AOJu0YwmEorsKhTfNvYhWP7TWSVY3R7jPOh/6K+3AE6KPjoOKE52MvXi
	uXVGQE2HLsb3BrF6UXGCvZg=
X-Google-Smtp-Source: AGHT+IGq02q6EYdzv4j+dIJgAqXae16JDV44BC6e7208bdXWcap4pw1HaygLxTRCG/9TzNfLH+F3bw==
X-Received: by 2002:a05:6a21:71cb:b0:11f:6dc:4f38 with SMTP id ay11-20020a056a2171cb00b0011f06dc4f38mr4826670pzc.55.1693470624065;
        Thu, 31 Aug 2023 01:30:24 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b0068a46cd4120sm812253pfi.199.2023.08.31.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:30:23 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
List-Id: <soc.lore.kernel.org>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Subject: [PATCH v6 0/2] *** Add Facebook Minerva (AST2600) BMC ***
Date: Thu, 31 Aug 2023 16:28:16 +0800
Message-Id: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 link : https://lore.kernel.org/all/fb09f5e6-8381-312f-2f1e-f2b471cec68a@linaro.org/
v2 link : https://lore.kernel.org/lkml/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/
v3 link : https://lore.kernel.org/lkml/20230830025133.3756506-1-peteryin.openbmc@gmail.com/
v4 link : https://lore.kernel.org/all/1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org/
v5 link : https://lore.kernel.org/all/5347163b-c225-d805-d851-fe28e6b57c56@gmail.com/
v6 link : https://lore.kernel.org/all/20230831072048.3966398-2-peteryin.openbmc@gmail.com/

Change log:
v7: 1.Change order before aspeed-bmc-facebook-minipack.dtb

v6: 1.Correcting the arrangement order in Makefile.

v5: 1.remove redundant blank line.
    2.Correcting the arrangement order in document.

v4:
    1.seprate dts document.

v3:
    1.Fixed commit description.
    2.Add sgpio line name to sgpioP.
    3.Add ipmb debug card bus.

v2:
    1.Add facebook,minerva-bmc in aspeed.yaml
    2.Use stdout-path
    3.Add Makefile

v1:
    1. Create minerva dts file.

*** BLURB HERE ***

Peter Yin (2):
  ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
  dt-bindings: arm: aspeed: add Meta Minerva board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
 3 files changed, 379 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts

-- 
2.25.1

