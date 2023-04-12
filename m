Return-Path: <SRS0=MDPj=AD=gmail.com=mibodhi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEC1C7619A
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 02:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49B77C433D2; Wed, 12 Apr 2023 02:58:00 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C026C433EF;
	Wed, 12 Apr 2023 02:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C026C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id w13so27389355oik.2;
        Tue, 11 Apr 2023 19:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681268278; x=1683860278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBFq4BHhH/cjgo3hbq/bqAErrb/K3fGnq66n2iIKmYk=;
        b=e1Q2jiqOH7wW3KWNsflgd8NjY+K4Ulk1rGHEeGeuGBrOrOGAcznh+FtudInqmiSSou
         NHJCXgCDAS4d1ofWyqVuWF2ZK3ECZ9wtojyTP+O0NkpT42TpwtDj/iuvrKnIFsF0NttJ
         9vfOYl3kHxQltIAM6WGQhlxVNEbjuYzwv0qfr9LXztTECT9t8moq+6BLSIJOWh4sNlrP
         XwZPe5AU0Ht8PAMfK62fc5ConQ+orAm84obW762drf//P8TAYlQufS1pEF3Old8CCPah
         koI+urtWwk7LAcxnOpkwetpOfjpkJ0fy08PCJvvexFENjYAWz1QI5Tt7JJMpcPCNHfEp
         eeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681268278; x=1683860278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBFq4BHhH/cjgo3hbq/bqAErrb/K3fGnq66n2iIKmYk=;
        b=x75mj8s4LEkj4zLm6beilGzho3R0nKhc/gSPt97NzpZUBUKVyUybhr29kQnZIfD4Fj
         naZO13GuiyQ5wUfLxGSThoQE4mKGyGqE1G6uoiIVuSExyslogK6+aoMIbJOpfT6Zcfl3
         tL5bSWP29CtU7MyfIzP/qNr4bDAhQsCgWTd6cIZJBVQwdBkV/l7zqI45SlUcJ7LSsOUh
         3SJaNSs2FJ1i7hFtUazZsOuiV7nCpj9mpUNk879HHoHB5SJyR0IFJXGcfJVL26//9Y53
         9m/4R7Gc4CctOxNcs8tqdJu3KxVLd5+cQCwECMKUBNBbYJz49odtJCk3WSamLJ6+B+2c
         DHrg==
X-Gm-Message-State: AAQBX9eUZstFEMh+G+bwYDYYZC8+3Np2ES3vok/i4cZG/8oxRDTRFKIa
	mxOh+m+Ln+QFdlhmdE/Qgug=
X-Google-Smtp-Source: AKy350ZL3k2HQ1msLFr3129WnolMPaBLSMdDj4Bc6jcq5S8BBlX+vDi4HsuaMTQpgJQUOhsM+goNjQ==
X-Received: by 2002:a05:6808:8e:b0:387:2075:59c with SMTP id s14-20020a056808008e00b003872075059cmr249676oic.37.1681268278334;
        Tue, 11 Apr 2023 19:57:58 -0700 (PDT)
Received: from localhost.localdomain (76-229-100-169.lightspeed.irvnca.sbcglobal.net. [76.229.100.169])
        by smtp.gmail.com with ESMTPSA id b124-20020aca3482000000b0038bc0cb5d52sm3013293oia.9.2023.04.11.19.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 19:57:57 -0700 (PDT)
From: Tony Dinh <mibodhi@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: Tony Dinh <mibodhi@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH v2 0/2] Add support for Thecus N2350 board
Date: Tue, 11 Apr 2023 19:57:34 -0700
Message-Id: <20230412025737.20280-1-mibodhi@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Thecus N2350 is a NAS based on Marvell Armada 385 SoC.

Board Specification:

	- Marvel MV88F6820 Dual Core at 1GHz
	- 1 GiB DDR4 RAM
	- 4MB Macronix mx25l3205d SPI flash
	- 512MB Hynix H27U4G8F2DTR-BC NAND flash
	- I2C
	- 2x USB 3.0
	- 1x GBE LAN port (PHY: Marvell 88E1510)
	- 2x SATA (hot swap slots)
	- 3x buttons
	- 10x LEDS
	- serial console

Changes in v2:
- Add marvell,38x.yaml. For now, add this binding to the Marvell
directory to keep it consistent with other Marvell yaml files.
At a later date and a separate patch, consolidate the Marvell
yaml files into  marvell.yaml.
- Fix various DT bindings conformance (too numerous to list)
- Vendor prefix is not necessary, so remove it.

Tony Dinh (2):
  ARM: dts: mvebu: Add device tree binding for Marvell Armada 38x
  ARM: dts: mvebu: add Thecus N2350 board DTS

 .../bindings/arm/marvell/armada-38x.yaml      |  27 ++
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/armada-385-thecus-n2350.dts | 432 ++++++++++++++++++
 3 files changed, 460 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-38x.yaml
 create mode 100644 arch/arm/boot/dts/armada-385-thecus-n2350.dts

-- 
2.30.2

