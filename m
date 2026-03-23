Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF341D63F3
	for <soc@lists.linux.dev>; Mon, 23 Mar 2026 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273112; cv=none; b=kuxjT9hHL/2QJVPuA5mc6zQO5YNNUYuWkito9Xa7LjjQnxWoYQnlLZU0llNzKZVMW6RD8ZaWoaOSaOW2LX7t9d7yNiXqYN9QOlQ780m9tcVxf5dVEZchHZoH1CCnlZTee/t0LO3G6cgAeux+Yy37tcxXjNrXioO4uDIr6gvpEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273112; c=relaxed/simple;
	bh=qsIf7ud5Ph6QqblFlecYc9fYw1lGDBnS/dITukEPMTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PuYBIjC0D9FiRMuK4gAuMxf+DojYtPo0/Xx+x5eB25qeW8JZUtm1AMsTfL9NUbjp0pN4rH3zPU5zNsMu7/u51qPkauY3pLgSyedCFCM9zTevHyN7INbYJ7cFAwfIJLFgR1QtrYOTdctMZQgS6FBs+VNnPyutgKih6Vjqvga9u8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsLo7xSc; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsLo7xSc"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8297310ce0aso1760967b3a.2
        for <soc@lists.linux.dev>; Mon, 23 Mar 2026 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273109; x=1774877909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn67HXpA7zjDtiRyKaRULlABylDK2UruwZzMMz6sLEw=;
        b=IsLo7xScAgGqEOqOCSFdkJS1b4XCMeD0XxPWJzL142zmjqsS+L9bKB0dZGkcBLcqmw
         0DWI18ENRd7Oh5amqhr/spj5suakXday3iZLoflvO2tnP0RrT1LIfK25WxPDI7Ppqf6L
         pqcwnr92SuY2BEnVlEf59d+Q1silt0Mp44yVvq/YAbEOtiPljCb2JVwqAxl/hnw847jf
         XfH7OAfXEzZo/MHw+SLBzo4y/CpNJ4tEbOzFmbxXnJrkNpumMxuF3baOUhustOfVeTwY
         2gWDkFFWfLnleC1kaVINzMS/noIWKeGuOeIBTTWOXL1SyjiqLNfVYv4tQ9CH05CzXUKF
         9UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273109; x=1774877909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn67HXpA7zjDtiRyKaRULlABylDK2UruwZzMMz6sLEw=;
        b=Ex49FfwyBl/WJFksh4goRwIdR5jQ+/kfby0h7HJsyR0g5gAImI7y9OPRPB2yMUMg8Q
         b2rHPU4kKx4shAaCdflMi61/lASny0IjFXc1QEtbqNNqBbdj9G/1wSDXz4ugLlrCHmCQ
         rciwVgs0svG0MY2r1BcszlNBjebc+rPGo3Aw8QxYLqlH8OC8eT3JZA16823DkjyQl0V6
         Iwy2IiatovUOxElfJjIWZtfkbjZsNXn79n+PSO/u9rHnSYKMdnWJMhmm00P4QzFpMZf2
         1su8g+xgFF6OnP9Znb98+f5V7fjf6H1JApeJXCqmlUMDVdN7v6LblogyhuipmZYQieO9
         Du3g==
X-Forwarded-Encrypted: i=1; AJvYcCX57cr+fva5L2k5b6fSW9bILrs90dpfp9zWxGIxUtAowkCFLASMqUomjbW8Ixes9wk4FbA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZAzME3oQK/gVqpudKKiP1p3f95buisFo/yTH0jbtSHTC9w6+/
	NQHLdhMNF5fV0xGwpVyJ054H3qgX8codSy0ShRSkC/bgN/CimdZUCJuc
X-Gm-Gg: ATEYQzy6qLvRwzz6EVt67jlHd/X4VhfFnuQpX/vE3QWSMx9cVolyzr3qMuKoVfbjSl6
	2h6bksPcsfKQ/kDQF1oBY0ieX0TYToIbzxI/waSGTrH5cxOJpzzp8s/WZcSetfVgAJ6YgNup++Z
	r5b0vz86yceMTt4bFnlmanLaivkC8Uc2jsjM0X9lLmTi+euYn0DnpOsGknCkXn58JzzId/sh7Sp
	eqTDdnUXkPNerhe7Cxd0RV6m+y+wvIiEhfmYhA0P37vIVqM0phjppe6IOSG+/VJQl59bWNoCtQ1
	zJ4qJVpaqfZxPPmFH6+LrSSQRt6RSNW8QqQ8IOGunmf3I/TczCuy+efOJ0rjSBfoQH0pKTRcjW8
	mtUbPZ9XmnGOuMRsMC75efqZ64m9YOx2mRGWRni4Cb6ke8YvC2x0KxJaEzxTdBZ7Ixf+5BTiR9F
	Aviu6VZcJqoTmtR2lamFo06YhftObOE0PD5NDXCGM3A7pLes+mF36HEUM3EvHcX+1yhnuhtIMdE
	vo=
X-Received: by 2002:a05:6a00:10d3:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-82a8c301dacmr11323142b3a.34.1774273109336;
        Mon, 23 Mar 2026 06:38:29 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:28 -0700 (PDT)
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
Subject: [PATCH 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Mon, 23 Mar 2026 19:08:07 +0530
Message-ID: <20260323133814.14152-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and renames thermal_flags property in spear13xx.dtsi to
st,thermal-flags to fix the unevaluated property warning in
st/spear1340-evb.dts.

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: fix dtbs warning on spear thermal sensor

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
 3 files changed, 37 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0

