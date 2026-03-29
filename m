Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BEE3603CF
	for <soc@lists.linux.dev>; Sun, 29 Mar 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787704; cv=none; b=QOZUw38nnbSOcjppQm+mJLgBe0vZIxYXzMlNEnjUGAhTIo5Fw04WueJSju7Bs11JJ0KakDUrrKC4/G7pLaBdz5O79GZo/+iLdZWp0/4Zxo/gNvGb8dXTvE46awBeeRphajX2hBCw+xTBkugs1M3aNvrIi77SXKaXOU2EprAJ8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787704; c=relaxed/simple;
	bh=oitH4XdOfl+jmDNpdoZa/ejnZrlCgKiTDVXgtFcA4oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYu/p3LohLlpUs9ArAtib8J/ki+MEYr+GdGkpdehKMIyetluPM2yeG9TW5EIWn9mVu4ESDLsG3mbO2rr/Ac4e7O2MzZ9GXWgqprJx7hqx7Y6izukkt0mtg4wxi72AGP8SEPTBK0UK2PKobqcbTgMWNg+BxAAkcXRZEwN7DxzIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARyI54hn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARyI54hn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a8fba3f769so14265075ad.2
        for <soc@lists.linux.dev>; Sun, 29 Mar 2026 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787703; x=1775392503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09DmEJZvX6q03iOvlAg7HJKVIb4nx37LesonFOCNgHw=;
        b=ARyI54hnewgvv5gyPg3eKFj2ALpty5F/6XgPZAqsceJsXURpPNHOzJp1Th28Sp+C/w
         SOiWNx53maJzXspSZ1hv9g4lGZ9weU4RX3ijCCs9SWY5bR1MuyEeZf59/XVCTP2H1zEP
         KvucKWcMhmFS3QUUwlPANzdxZOdrCeaYFuwm5OeKlkhfw01XDhdVEulDrPzUYOIN/OPs
         c5wOI+zOyj36L8Ko/nlDSpcCMWUGU25SpR2ziAbn9GvYWVGYaEK2OTgETmJfA4cqN5u9
         7wM0yxHEcMr0AFc5dDOW8EIh4ChX/CdWbQwmho3xyW8SrsIdd0VXIiQQvEl+JebPyNUa
         /Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787703; x=1775392503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09DmEJZvX6q03iOvlAg7HJKVIb4nx37LesonFOCNgHw=;
        b=PFn+76o6hKcCFzzhoKhEmSZIgoyUVJl9MXKgR2xZCd2zw0UPOfR7enB7yq8kpoBySe
         17XdWPsa99l0YBYITMrfZmkMFNWaGrH5OIRJSPFiVRS9aL22DmbBRoY4lmGp3gbsaPZ2
         xGI8pwsEaseTL8SKwMGzP5WO+lD9KPPmGpe3RCOagajPM8IQPnL2SZfX6+a3mPuYCNsj
         Ggkj96c3JVy0zsZSZFDGT15y1HYvgFuW/RK6OLjtkp3NgCogYYj6oFfitByRyWjcehXh
         1nc1RkYbftlOBBBw3lSTXvez9zzueH53U1v/9YeocxFurogzw7gq/NRR2zDCdRQVz+NB
         KV/A==
X-Forwarded-Encrypted: i=1; AJvYcCVTH8W0WIiLiHJPHVUft7LmsQ8Exy+r5czLUqzQvWb7HIcqKBdzY+tWDAxm5m0TlHZ/o9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDlb1VLYHCsjEP+j/uSM3taklXpvNFUoqPUpWJ9nvyqS6eyfJN
	NthMsHZDQi5ukjJ9dPgN5FoUeiQOjly8JtmOHDvMoMBL+LjHwy5N/bGf
X-Gm-Gg: ATEYQzwYHEk883B1heK8UFINULRBrc+nABX1QJTV9lfkwZFsIyJsj1UYhIpTmRG2zQ/
	SinOr4ZwnzZ5yLXBnE7msWHI3GsqtGdpdpKWuFZR09enew0K/4JVatVozPuEbQovqA1Ek3zvNBs
	/JhD7V99Kj7We40PrhzolHb0MpBSZek22aCtbEzjJtNxrP6ZqoibdXBLWKMPPbIDleKaKUROkIi
	fUEbke+/egmx3O3I0gj+WOARXimw3q5VCaoPKln8gQRiVcQ61MriyGynOZFH5MeNekMgsAqNLQk
	rqZAZbORA0BIyRvRfh0RYIC8HXg0jOaxgRHHSwqq29mt+sfaugBb7j4B+WVvB8FdOE8DpwOJnjU
	pmG4Us/Ea6nX4sQehjbRQLbh8TEVatkenuGla/IJOWtoEX+siE9tQvXbaUDisqh3rprmjcDX6Tz
	L1ht2ZFxMMvzXqoX8m2jqDFE3zDKPa2ulas0hZ9F1419m1Os+LwTOA17DSjamG8Z6LBjmumfR99
	3A=
X-Received: by 2002:a17:902:e54f:b0:2b0:6df2:8cd2 with SMTP id d9443c01a7336-2b0cdc239a3mr94457085ad.19.1774787702960;
        Sun, 29 Mar 2026 05:35:02 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:02 -0700 (PDT)
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
Subject: [PATCH v3 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 18:04:42 +0530
Message-ID: <20260329123449.309814-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and removes the thermal_flags property from spear13xx.dtsi.

Changes since v2:
- Reword the commit message and subject to correct explanation in patch 2
- No changes in patch 1
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: remove undocumented thermal_flags property

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  1 -
 3 files changed, 36 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0

