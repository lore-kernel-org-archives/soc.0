Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E10139E
	for <soc@lists.linux.dev>; Fri, 16 May 2025 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747374972; cv=none; b=pBPLpFdfA9IZjS+jGL78h3GIngjuY4vy1mgL+aWE3HnUAjRBkm1k//xKlYoPMTaoW+2xaT36f8UN5DLkVkHMj1Hn6/dyBIu0JoaOPOufOLDmNUU6Jbnii4/o2ImOAtOrfgl5PTq6chpELFPRRAy8pTeg75nbGL+bhP4LI9HpJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747374972; c=relaxed/simple;
	bh=PZmhJA6QE4OvbbRGFZOb6Do7iZjjwGhAurwCX9bImoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYPhYfiFK3FYYGPQbfgZPRxLGimR2dlJyD0ftyez7TjOn1Zr7K8K2I/CGXdZx3fmPSHzrKqb/vzmnfAXZXeicp3YOcEjK5kPkTqGniQAHjjSP2odkEWYB+VxIiHcwDsGkJx4cr2iMF/4Pl98G664iVg5MOJ+2P0+PsB+nJaSPsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PZxQnTdv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PZxQnTdv"
Received: by smtp.kernel.org (Postfix)
	id 0A349C4CEEF; Fri, 16 May 2025 05:56:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90022C4CEE9
	for <soc@kernel.org>; Fri, 16 May 2025 05:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90022C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b9303998so1109451f8f.0
        for <soc@kernel.org>; Thu, 15 May 2025 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747374969; x=1747979769; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+K6u+qS4LSYc/nHb/eBW61Vv87dsLXyYUJoS3HMuo8=;
        b=PZxQnTdv+tQwmiDUYOFpBXJgiCh0Wft5Nuy6NlpOlu5shwAXO7vskhRSo6CYgehxDn
         JfqRWvsvGDTC2YMY0yvFSdZdhk5DglwEnlBmxq1Nb0AHy4uNzdhGw4k5MttLMajjrMz6
         lVSxRgHIOiXZq9WYZlYSleAG/4h/cmfo/JosDW6UUE3iIvs1yh1cxQ9HBDqD+iL2/XDN
         +TJ3n5oCw5oZtIVIn7XBpGvnHPJGsuWIvKdxPgo6huQXZxI5IRHANFtbS5nvSOmf9aT7
         VAbOY++wRGOd837oKs+7xWoRUAr3hPU+YzquEhasdrQ43ML5lBOzcUXSNriZJno24LAm
         MhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747374969; x=1747979769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+K6u+qS4LSYc/nHb/eBW61Vv87dsLXyYUJoS3HMuo8=;
        b=Uk7KdyB69aI2q0UOh+p6FTV8YBYPytyeCKCihQDGfruemaOy7KEACq+wwXzMNSI38P
         c8JxPZZBjqWk+93AkTRvecJfw36q5dIowGF0mcGyL8G718vuxyZSMgfUs6Df2rrO9IYO
         BUcV1hkRRme5gV3z4986SsOdSqsBpjvGdLN5/jOWmLoe/QsXjGa4LlDtACSR1fnSyj7t
         g12AtQuJbZ6nJCXluOGdjic+/oEBwwJ7h4Y0jtbPGJqCaEqfPAV2qUYIOXEGibg8OQWk
         FgBtuD9SslW397cinONeDcjVKcl8nc3LkaN9kvJFuWna/gqOlVTyTDTXfNaqZBjoHsXQ
         j5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXUliCAGhvU0loYEJsPMC44mLg8nPEc26ikjWqXiWuxQ9zYZ/FDIaLfpELwQcvOk7y5R1I=@kernel.org
X-Gm-Message-State: AOJu0Yz1cAgJll3SXO0cHuF9H09T5dlDSYvbTMfrK8MMYnn2UrYHv7PC
	2kDmaW6zNQVAVnMixIPr4EjgDNVkeHDopsMRKfMdmrDGyUUjx1gGUupBshfXwNAVwQw=
X-Gm-Gg: ASbGnctJlvMDu436JOjAmO8OkwpVC4mhpmMNsMzgc+xvDqNexblNiEWGssIFHepH8hm
	gD56B8gah2KOzjnRZWDKjSER+JMu1DJLhRJxDlNKzCD8YG4yBsJtRki1x8kQQIkvPjvdFePXoHj
	sfnxdfaM0+ecnibQ0njXwtBNeLx0dvYiDBkJM4+XRsNVDYNOdQ9k/ios7R26W4Cp9ZrCA598HgZ
	Tfcq2zngRyrjZy/dpL9XkPOgvpix0blw/+zpyvptTDdo5a7WiHS/tnYeTq5779w8u+yleIIu9Gb
	+KrLmB+06QcdhufxhRJZKN0j7dDBKxiBlZQKJRiunKqRUHZWYBgEe+6QYuRf4XOG8E9NAQ==
X-Google-Smtp-Source: AGHT+IFeUbR/oRAievxGGOL7Ute+w3SGan2dAe/2cFQESS8zNaK4mJcC+xdPCx24Pvqngoelfm+bCQ==
X-Received: by 2002:a05:6000:220d:b0:3a3:5a95:a2a0 with SMTP id ffacd0b85a97d-3a35ca8217fmr1640934f8f.17.1747374968820;
        Thu, 15 May 2025 22:56:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm1687478f8f.22.2025.05.15.22.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 22:56:08 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip ARM64 DT updates for v6.16
Date: Fri, 16 May 2025 08:56:07 +0300
Message-ID: <20250516055607.11248-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.16

for you to fetch changes up to ec32344d2a3b841d096c12cffe8e620ad117a6a0:

  arm64: dts: microchip: sparx5: Fix CPU node "enable-method" property dependencies (2025-04-07 16:02:43 +0100)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v6.16

This update includes:
- fix CPU node "enable-method" property dependencies

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: microchip: sparx5: Fix CPU node "enable-method" property dependencies

 arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi | 2 ++
 1 file changed, 2 insertions(+)
