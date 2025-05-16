Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F080D27D79F
	for <soc@lists.linux.dev>; Fri, 16 May 2025 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420263; cv=none; b=IBtWGxzHQPmifEl984AhdEwq2ot9F1JB201TBkLmNBjY6OIuP5f2Fx+DDoGEb+XnHUXEUbMYyxQM35bXsFY8h2uAtJJlv6EJzFuP0L8niD1xBN3b+FFikNTQhCG2TnQus8jbJdcVU7moPO5mC64JqiZmZyzycX1r69TxtzI5lpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420263; c=relaxed/simple;
	bh=E5HAH9f2vgQ7awdooyEeBJ8OA/ElHg+RECh6OV29pXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ASj4zwixdBBMjFh9RVGhTxE+jCPedkN4/S4J99WsJIVuUDrFvMV0eSFGSgpp5Pkuu5bt4/7zgcDvfC1JLcBl7uwHZ6K63cxp1G3R7qGMDILTsarHwFeWsaD1j9LtY1U4xc23fQaEoocTZAz4WfXKRlCYHtDKrq6bbdBidkrUKgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axXDsFxo; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axXDsFxo"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87be2373596so615082241.1
        for <soc@lists.linux.dev>; Fri, 16 May 2025 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747420261; x=1748025061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjIRRc3m/VAxY73bP0A+3mCsvKJgmOnqJyXLSLT8exU=;
        b=axXDsFxoyd8ojI4i68E5CiR9UR3dRcKhbXOoXjPTpbKGdaBmD8A4bEw6HM3ory1JAu
         S+RUH95gpXHPau+XchlmIafS8iMLIwTeQ9pbsMkK6acoTVj28WgvB6l0Nez3S/z7TI0d
         Ts7JqGTLMhY85JvDTGjbA3rPI8mI18uJvSk9GHmuMHvjmM5fWsqW2HSq2U9Dg+xFuMyt
         3UzWXc5G0EkeCt2GoRxZ7f6Fdp8DeiSyQKtvtt5oMH//3ammOkvYJ9h2d5EJnSzCYBFn
         oLTLdu/FG6z2AW+VcMx/hc4HQC9aioan4RhUWcu3U5gbZaASf9gOV7pKD9OeInmykYO5
         93iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420261; x=1748025061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjIRRc3m/VAxY73bP0A+3mCsvKJgmOnqJyXLSLT8exU=;
        b=w0nq7GM8nPWXgODsK1do9rkX4bvnfvnciKUp4oDYdBSeA/u2tPxrIXD1uIlZiNzEzY
         2OdBBMOEynpdCJCaZX3jXXztHBtjbQ6P/YIqLNx3hjjdCXHZwalZuAYtOOnhnhq6M3K0
         bBy+8vCuwylszL6khGDPajOsTJUJKShGSmXWCaInLtESTWhTOXCterIf+wsmpEsJrQOg
         /4B/IiZCrwJMWJmWGOIcgr4m0O3JLZaWFgxhVmKTjqrk1lcEeVpK1aVwz5QiX4nUrowr
         nm7NJLh7nJBVV0P2UDuRYzJNlvGwOOSfqY/1BS8TnE0tJ/nB2pIfLFzcTN+386x1tyj0
         597w==
X-Gm-Message-State: AOJu0Ywlpk6Hw8Nz2WNW2Mx4KQC+VJLnyh6tTRTR9BU7KfdTJ88Xk8+w
	PcDx4sn5+suWREzzND8jGB0CpiOIaCjPYiBxRR43/kd6BoDvxvyfIrjvU0U2dA==
X-Gm-Gg: ASbGncvtSL9k3kBWcxqMDy0MyEHRuQtwxaN9+9FHsFBkwkMSV4/IUSNaHOgRPBLTPa2
	qKGpZm165aAM7K9w09lii+/0M+0qmRocub2j1oM9wCgMgkgjrVYNn1qBPqht/kieurbX+IkwyJm
	L+JAqCGbZkX/ZnyQu5QmQZrOJWGPt1AMkOMLGi9MPsvdww1SB5GYeWyhLiWdVhIYsp5RcX4DN+9
	a3Vo/7AZxxTghpXz2oS6g7hYYF6VZrsCalAfD2Xa0UitPrCI/EGwmPs0wQwnp3I9l+qRUv8IWzA
	1OvDfnAwAdTYzR1HwLhoxq6F6gHXpho4YANo+xD1lvicaqUjm6f937KwvYs8QnCNUQ==
X-Google-Smtp-Source: AGHT+IGP2sbYwMDlV+BPtSVT09uB94OWwAidwDuga4z6Yn2RSTFy2x8+4ClJoDXh6bPPZjOSVZIjSg==
X-Received: by 2002:a05:6102:6c2:b0:4da:e719:e7f8 with SMTP id ada2fe7eead31-4e053d6333fmr5003602137.24.1747420260003;
        Fri, 16 May 2025 11:31:00 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:93a1:94a9:517a:f69c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec225c3bsm2119351241.29.2025.05.16.11.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:30:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: arnd@arndb.de
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] MAINTAINERS: Add ARM64 defconfig to its section
Date: Fri, 16 May 2025 15:30:35 -0300
Message-Id: <20250516183035.685914-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Add arch/arm64/configs/defconfig to the ARM64 MAINTAINERS section so that
changes to this file are automatically sent to the appropriate maintainers
and mailing lists.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..82bd864b1972 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1937,6 +1937,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc*.rst
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
+F:	arch/arm64/configs/defconfig
 
 ARM ARCHITECTED TIMER DRIVER
 M:	Mark Rutland <mark.rutland@arm.com>
-- 
2.34.1

