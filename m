Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0423B63C
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197259; cv=none; b=AXds0OUO+aSjsuJ5WnB3bCsyZRAsybfrQgUS5cY5WdvPZ4obe3eliCsDd4QcMxLBJXezc4gjW1ihEFoBgcGRVTP+kVtOvGAdozPVTc/xPg6+KG4yaphG569eNEpmPyIJ/ywyI3YBPsbMEqyB9gyeOTiLztk2xfAhzLnr+pDiWC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197259; c=relaxed/simple;
	bh=aRsqKglc10I3GhHgrrpGNuTdBDyQwTu/Vued++Rw1PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jheLSIjRF3W9K2ip30VUR39lGv5LVHpUr9fv0I97SlAy71jq4EVvq/MviBhqu0kYJSAQEohVdFyt3XbiWKVB5St/dzQizzXSJtYuszajXipUyHU0ZKiVVLeDNO6anvfRYQcGeuWs/C1wnqsPprBfZLIhBa4YWOGU904lJBeNoyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+/9otGE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+/9otGE"
Received: by smtp.kernel.org (Postfix)
	id 4CE3BC4CEF8; Sat, 15 Nov 2025 09:00:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DC9FC116D0
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DC9FC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47796a837c7so2718435e9.0
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197257; x=1763802057; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx2ts+fHPLoBy7RLDZLOGCht+3l+lrN74DzhJ0vF3ag=;
        b=L+/9otGE3xehYvaI7xe5rvGFMfh+ycqIuFBj32vbVPX+64zOWLyV/uTWUzJP8J5V35
         VFCSEWOng+S11j2p9CiQdoShMF9KDzF6LkB2VxKfTzomNxCZlEcmliZiLVEGyom/iNle
         eU6SWwFRNt2HIn4YUmj5/hVSvVWeTzkiS2LQv/fgL8rsgh1ueBSdNIXJles34v3OSoWC
         1BWs3adWG29xYFSDqcnmGupo28CC2ohiZ6G+zlWdiLFYgovLoS3HUhysp8AN7QmbMSWE
         ctD93etPhVKt/vXIwG55DdzKcaoVsa8ggZI/P372P0wzZHlDgjE6uEDwbYxi3gLhLCzu
         TeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197257; x=1763802057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fx2ts+fHPLoBy7RLDZLOGCht+3l+lrN74DzhJ0vF3ag=;
        b=KX6BAXZ3tnBFaUaJ7ytyrJmPnNWoFKSEoD158GZlHXs7sJ82uTFweNpxUovAheE8Cc
         ZRWOoxsLqy8NjK79QppQ3fmmHeBEOsikAbQS5Olfho8hXkwS/Efc0j5CBKlH/vg13oKV
         xbsCdpyxBJQRG6e3qVP9inscopu19oBFcKAZcO2MiFKWqzcTsnoKyQMT0xIcCgIDJjgr
         O02LFRiYLYTMNrzygajeYrq7m+UGCy8n+5IQ9GLTUiK+CEmlYV+EBwnUGV3qbmd9zi9T
         3qwQDEmhCsr4GPMppQwsR+lQnnYpq56nDgb+l2oeVcwT4QubfAin56JVRFOMeSJKbwGP
         N1nw==
X-Forwarded-Encrypted: i=1; AJvYcCVsRfB1KYj0eKDbAa9ygQWoKOj1wuFBhW1mKkNMRsi230NRyr5zZvMOkSuZhJx+fVThuho=@kernel.org
X-Gm-Message-State: AOJu0YzfVgUEcyKXbnYbxE7xVzDJhQufNsol4u1h51u0jVrHLVP1dccS
	w0O3VYkULt9lE0lzq5rjr1a/y0DhH+hhSOsD51OTNwLdFat4C0A8hocS
X-Gm-Gg: ASbGncuxmSzSlzwCcuwikYw8QeeDMgjx7uhhDNBuEQtq4l90lmQsWquS0aJs9ZnPsSi
	YMIVbZP/WlVGcFv4J6q1Emm6H/Xu57LYxXpmcMhnyQ3g9ca8D9XbXmHOP7crEINw1hKGNYLdft2
	dVYr0g95sPz575UZXdDe75TTULSe7XU5gk7yiZjMrxVQFHQeqIYIfD607h7YskXt2T9u0wlZaqg
	PO3YYy5HHgzXUu7xks4NGpsi5Br2jsqPVaNyLbE0laAXMkGNpa85vp3pH4KOBDwDn+fKJLrJ0zl
	YNKjEGo9bC8OfFXev5oZgQI6o7qyWCWT+2C+0zdWJNkY27uoUdmEQczvYOCCM19rpHIsspQFsu0
	L8YCrUfB/Kn4NhFr5yLuHUxQ3BQCnWtfzRgswzdd+wmXcmBaz5W9fa+pgaHW5V7IEV9ZB9OQRsd
	k5hvlwm4bzZq2en7OSLBAcUzwChih2EqOnubTl+eOAYb2KMYyz/+FliIYi2lsU86rToJI2
X-Google-Smtp-Source: AGHT+IGyB/RQW9MTVswcGv4cxhGmARlI02larXZ725dOtFz0GZlaFld4CKIv8l5sOZoudOnpPEm27A==
X-Received: by 2002:a05:600c:35c9:b0:475:dc98:4489 with SMTP id 5b1f17b1804b1-4778feb568amr61956635e9.33.1763197256667;
        Sat, 15 Nov 2025 01:00:56 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b14bsm14443659f8f.9.2025.11.15.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] soc/tegra: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:39 +0100
Message-ID: <20251115090044.3140331-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-soc

for you to fetch changes up to dd03d34d6d8e7a3f62450fb7a1408d86fb35487c:

  soc/tegra: pmc: Add USB wake events for Tegra234 (2025-11-14 19:29:50 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.19-rc1

A couple of small fixes across the board: ACPI support on FUSE no longer
exposes duplicate SoC information, speedo IDs for Tegra210 are updated,
some comments see typo fixes or kerneldoc additions. Finally, support
for USB wake events is added on Tegra234, which allow these systems to
resume from suspend on USB activity.

----------------------------------------------------------------
Aaron Kling (2):
      soc/tegra: fuse: speedo-tegra210: Update speedo IDs
      soc/tegra: fuse: speedo-tegra210: Add SoC speedo 2

Bruno Sobreira França (1):
      soc/tegra: Resolve a spelling error in the tegra194-cbb.c

Haotien Hsu (1):
      soc/tegra: pmc: Add USB wake events for Tegra234

Kartik Rajput (1):
      soc/tegra: fuse: Do not register SoC device on ACPI boot

Prathamesh Shete (1):
      soc/tegra: pmc: Don't fail if "aotag" is not present

Thierry Reding (1):
      soc/tegra: pmc: Document tegra_pmc.syscore field

 drivers/soc/tegra/cbb/tegra194-cbb.c     |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra.c      |  2 --
 drivers/soc/tegra/fuse/speedo-tegra210.c | 57 +++++++++++++++++++++++---------
 drivers/soc/tegra/pmc.c                  | 21 ++++++++++--
 4 files changed, 60 insertions(+), 22 deletions(-)
