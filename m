Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6922E21FF35
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271792; cv=none; b=PjiH5VXRXkYMOkQs4QpFcl1blmdYWekj750/+9EYe5C+BYadrAyqLY+zIuqNcfrAcOoRIrv+PX7nssEaceliFlI4YGEgoWC5h/TU1nmliJz8AuaTpqgEicEOURvQFXRib0v8+THKP7n4BJedBLaL/S2eJZH9v0aeANTx6AXOuQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271792; c=relaxed/simple;
	bh=pvllP0ZkWi2ON6gFXmzcXPaJmOGF7rmVV+x23nVmWfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dw2qlKamTWfl32aPlFLDZ7DO3o9xl3yd5dw4IRaJg3IGRi8AtG+IVHwypjZ0V6XrdfxNixqj8qt/OXoKW00DSWsuvtitPjiDIjhH1lF8Xwo2ssGrRYCs32WJi3M1cWCoSXqe2CdqgYWPejSzgqaRIVFRJybLYAloFrM38MJaSyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYIF0tYT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYIF0tYT"
Received: by smtp.kernel.org (Postfix)
	id 050D3C4CEF4; Fri, 11 Jul 2025 22:09:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3378FC4CEED;
	Fri, 11 Jul 2025 22:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3378FC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1645113f8f.1;
        Fri, 11 Jul 2025 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271789; x=1752876589; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=;
        b=XYIF0tYTnqSuJga8XNOoH514J+BOCCblDgOVTpdwlQhCOkRVKt8nG4tBHRbiRCR2+a
         dluSy2Id5o7svlLzQsUtsmlyx2Fq40kbZ9qrHZjc4VnQLqz+qhNpjcjnoS1G2udhWQeT
         E1Zi93/GZ9J8KJ1tiw1HCnfh5j3h3VM+lKcHaIWg62Jgl29yvC0bSZE/qzOZu7+ASiAo
         T1tXYFiXYfbaCUd4/k0UQ+h8BVkmp9bZuXbSxvcduuO+1yhq+afTRhfQxnYIGWzbCQqV
         pfh4oTa9Pkl2FhQNcMQ1Q178g9/OhnXZTgoum0Sc694Rfb4/HnqIMXtQklRylLXHsNRi
         tEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271789; x=1752876589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=;
        b=djWbEcRE6VWO9Vw7YnTv/crCiXa6i4QMy38RT+nQHXTBb1jE7HnyV79tMhmf/71a6+
         BRGB4m3+pY2fZgi+c5aLuyTpCBd6IBFhqaKdsYfuy1mVG6BogVEy1yB8R9WHB12t1SH5
         bHM5t6gwfzJ39RCB5kc2wX/q3wUgiewmupfUNzBTBjHEe7kDA62FZvL1Zh8Tsf6Yo6Ev
         kYxXIRTWpUucHAm7kD1KixyfsqVPTiWmcnnWGmhDttNGWWMs0zYS9h/LqhCDyuBVCN6c
         Aks/6/wseSnhJXa1FP/caM1p346Dck2riGgw3c3J8RmQABtLhFoG/VJiz/Cn7gW9LI1S
         hfvA==
X-Forwarded-Encrypted: i=1; AJvYcCUMQg0Ag7ESGHLwEUT8Zeez+o2gPsWA4BsBs+2kEfOVIaT1X7HxDIhT4EuZpOQcrOtUif4=@kernel.org
X-Gm-Message-State: AOJu0YwosjsGDHJbMiqJLK7OkQ4AQ2aEEMUl84gYl3TY+a5xctWBbK4J
	jUfktKT4kh8KpzYlfFyu5YJ0OVaHn6KlR0dgzmbw76J7bYgXxpGcWZrfnFODxA==
X-Gm-Gg: ASbGncv6VTD7WX1avNXqSATp7m9tRluDRTAr+PKYOMK7oT4AJAtjHEvYMhxy6/snTkc
	qCD9cX/ERTHvWCbm43FywooO0veL6ZQY7LaIiDyIfPdVd9SSdZrtsCXxzUsaQ2zq4wh5xZ//XRQ
	qfb5zYhCMtRaxaDgMjnC8BP7trqQdoavR4ayr4cuZb7gWKi0qYzsXq8ZNmbeCnQoTN2CL9io4TK
	fy0SF8TlGnS+fO/EMtCwUK6Jzp1NOB+lktSMA4K+v/y3T/KC72BvAPqpffv/1QnNEJzDiR0Yg8m
	JgTsgbS5a/fy82TKkWjxbsT250yS6FUu576rQscsEodrYeIL9iLUNDMpmR5Y+KP+G8kWXOOv90W
	s/MzXosAjrS9P0mihmEav6tvN86Eo471zuQWIrQP0clvZgjRnPq3I6mGApIAr9YVldw7bKFItVV
	f0WVnqsS3lfQTeWw==
X-Google-Smtp-Source: AGHT+IH1Nwmj1nJTt0Sx523oF3zbT+IqMBHza1/CIgwExgeLZ19zMtKml+bp6x6d1S9hslRC9/KXMw==
X-Received: by 2002:adf:fc11:0:b0:3b3:a6d1:6b57 with SMTP id ffacd0b85a97d-3b5f18d96e8mr3631673f8f.44.1752271788727;
        Fri, 11 Jul 2025 15:09:48 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e1e1a5sm5495462f8f.74.2025.07.11.15.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] firmware: tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:35 +0200
Message-ID: <20250711220943.2389322-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-firmware

for you to fetch changes up to 83f96a7eaaf0e3ac1b1447f74a8d3b2213187b6e:

  firmware: tegra: bpmp: Fix build failure for tegra264-only config (2025-07-11 14:50:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Updates for v6.17-rc1

Add Tegra264 support for the BPMP, fix some dependency issues and clean
up some code using new OF helpers.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: bpmp: Fix build failure for tegra264-only config

Rob Herring (Arm) (1):
      firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"

Thierry Reding (2):
      firmware: tegra: Fix IVC dependency problems
      firmware: tegra: bpmp: Add support on Tegra264

 drivers/firmware/tegra/Kconfig         | 5 +++--
 drivers/firmware/tegra/Makefile        | 1 +
 drivers/firmware/tegra/bpmp-private.h  | 6 ------
 drivers/firmware/tegra/bpmp-tegra186.c | 9 ++-------
 drivers/firmware/tegra/bpmp.c          | 6 ++++--
 5 files changed, 10 insertions(+), 17 deletions(-)
