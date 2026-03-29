Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2053A2BD5A7
	for <soc@lists.linux.dev>; Sun, 29 Mar 2026 06:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764939; cv=none; b=iqASW3TkkoWsHCuk0JK0UKTr822dbgCPz+rXe76g/AKYE/rpoaH+I3+k09h9gZgYCq+VskSvFVPuV5FPkVBmqao1/aq9la9G2zWyaNq6MXJHcsIGT5P/SZaIo4O3V0AQlvCMNHXQFF1JwqoHRCksaXCdm8elDjHSU4qauzaxcgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764939; c=relaxed/simple;
	bh=tLCX5T/5BD+D5hhrc5IQpY464+LnQSj92xbe4tJBm+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjaHeZ7yENIUTbXg5wNzESZwbzmlsOJIq2EGLeVJlRWIj+7QWIUyyDkAfdQ4H7L2CwlxnWlDaw/15BVoW7gg5XgTBC5vfWJnh4pJ389ZsDDOLx1qUFXNmMOuFqHuewVS9FBkeMHCdDbgKDdO1lz5vjURBruuhNgF+/wsZdI8Eo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bq13yBaJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq13yBaJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-824c9da9928so2341689b3a.3
        for <soc@lists.linux.dev>; Sat, 28 Mar 2026 23:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764937; x=1775369737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpxvjrCfKfWKOT/ha83hU/ESLCv8PWJ47jL6ccG2o9A=;
        b=bq13yBaJsYOb3yJ5Guf5/ut2hbuJVnVtaK/gAOuPkzsIRf8ILjjUGaEbE+ylcq+zXU
         aZYCr82VyJ35JAl30LVtMheP800h60x4NwqfhnlBHdmUbzHxPVnD7VikZ88R/AFiHc3O
         JDniIiTrFyZcR/9Ffo2fzEkbvQxndYRkZKJrcCXvCF0Q8odxihsPul3eNMfCBmRWlBb+
         evTsOTYq7LdElc3WIUA1MF2FUKw9RjLL5RDqC/sSEy394pvS2WnNhQ0e2YMpe9UMdJsU
         hnr4WAXtfiiiwEOLTCviRj6TJ5GVw5Yi9nQU624AbaAO3W//uEtwYGDq9uBHp4GGkzUh
         RyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764937; x=1775369737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpxvjrCfKfWKOT/ha83hU/ESLCv8PWJ47jL6ccG2o9A=;
        b=Zw94tBtSrhXFTeGstNdPWT9OkVVG9tztOuZLTmgFPonQ66Y8IGS06nriIsZBLzDUgQ
         8ejWecJj/IVp/WJK1HOSFXkXAceA2DlrGrjsyExyACEGo5qqOpcZH1VBjjMu1JUrxpPo
         Aza/rC3SyeB6i1VvS11MW1vraS+KUls2B118eQIxbRosgNDjf5x4veo7bSVvX7YHkIWW
         RI1DUBzJbyo6VoxqbJd6mtjbY4S3Vy07fLVZQOz7+aIYTXGgeBl6NivvOS5pcS9iX9RJ
         ajA9NxCXhh156bgLN/DiZUNNfTWuyB+C3GCLwiSPcGvf2NLuDaQPvkBVjrTeHI8UDnO+
         8tug==
X-Forwarded-Encrypted: i=1; AJvYcCWOEPbqL4RMNGgAr9KKh8JFwrbHUUOx4X8yx/u3bVqcM1cfKTFNK5m/4bG2Hj1zl6uqetE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHE5oZfZGCai8gr3AxYlOe8XrEvdkZlpfXNyrLEENkmzlUwCZC
	3dBrJe2OZpYxHYXLHfvQmyrOD6bVQpmfO+9hjpSBmpOqUhtOqrzzQLKY
X-Gm-Gg: ATEYQzzVuywZvPVsPXX/DWWmM46cQ3kV+ohAJ3vtYWw/H8fW50Gsr9qTswm2IHyeBe5
	nAmVIe+i6QIxtJBXcpFH5jtMMTWoJr5nYGZq/h2UmjNJY0ywuXGXUKNTDI/Q+L2kp/xDrvnV0qL
	4v7sz8Oc3ZW9XRx54WW/xakURHi/Lm+60semN48EGAL86t03PEFUfPsCiBDffuVfcBZneGgkrqB
	ISAK5lH4UyXlOUvhoH+IPgbJmfd3nrhanXtbvZEeVOz2vpDJcJZVARDhB7IDO/SPbDOMGxmI/Lq
	6ehPtAuUbJyALfxqphfaMBkIE3aQxw6v1rQUPv38mSGV/ffH5VoBLFWTtgpBlsN9AD5PKZzpzn8
	GEH8u/tBd83fA+9BfID8vT7y7XLWcbNaWXph+tMUp6fUnOUcY9CpIA+h4W/gU4INrednA+vIKp8
	Wzd9jgBVwWW2KZOIvwpOmeaCzs5BN9VN6iNs/xSUT4TB0igd+UEH4SeXJYXgm0XMUQpxSqVTzpW
	p6smXGcYbrGRA==
X-Received: by 2002:a05:6a00:3e16:b0:823:b1f:892e with SMTP id d2e1a72fcca58-82c9607f5b1mr7817427b3a.43.1774764937194;
        Sat, 28 Mar 2026 23:15:37 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:36 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 11:45:18 +0530
Message-ID: <20260329061523.98346-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and corrects the thermal_flags property in spear13xx.dtsi to
st,thermal-flags.

Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: rename thermal_flags to st,thermal-flags

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
 3 files changed, 37 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0

