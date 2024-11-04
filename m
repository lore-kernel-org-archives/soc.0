Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA511C9DDF
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730746227; cv=none; b=XsT6BlXq8DR0dbaZaolR47fdD70KIv2Q+IzLdn2LY4z+KqQZoVnXv68B5fX4V+F6jlODhh480Ax4g8/j9V9eu6DnA1u7etwkUI7GjtlP66gJowLMuSaNr+XV84x/li+Acf9uzAd2k7rXthdCirGSA3n6HSBir3KZheoJ4Z0IDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730746227; c=relaxed/simple;
	bh=BiURnDypCTHkTHYBVR9sKK/ECoN9gxqZVE3LBc/9/lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sD4whp6Dg7x2RWYe3bB+wOT1LxDSrVjyxCl4Ghnw0wXDjdwQrvzqpJecUMQrQgGju0LaYMZrlrVu+LMGCMGf2uim652VdaM/3Zg7jkR7V5tJs9O3jl1M3aKN0NIAFc4xdZeTCT4gDmKuWKufnahdT/I/hVSaktGKARVmCiW2REc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BU6q+2lQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BU6q+2lQ"
Received: by smtp.kernel.org (Postfix)
	id 54D39C4CED0; Mon,  4 Nov 2024 18:50:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33690C4CECE
	for <soc@kernel.org>; Mon,  4 Nov 2024 18:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33690C4CECE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c803787abso35672285ad.0
        for <soc@kernel.org>; Mon, 04 Nov 2024 10:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730746223; x=1731351023; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y9ByzT5rhkqv1UFXFeAa7XDWoMGVN9DTUnpFtsiZv98=;
        b=BU6q+2lQdyvvZ1zDxyDd416pU9dg24/4sZFbOUWrEWF1xVrWGDHolttyFgjcNu8qu0
         kBf8KWkeoEBydv2iSGrrZZfEMIH/rpGwnd7xhfY+iYSF0r4g8IRzRQP8sJmD8BNkqzDP
         mo1R4SiA/x3FaRGCbQGGDNGIuU0++vwCfQKt1QhpAaU/elckabzChqHaZ6rF37LDofrv
         bH5n2Hn46e/m3bdkIjBIrG+FvbwtjdHcQOXXGqg7B9exyLnsihQME1nG4suD02aZdIGl
         ERQif0cvlqs6inXCK47waCgq6L4uANKqZA5Rgd1p2E7qSHnPXAWdpCMxDOFjxSEK3i+u
         bRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746223; x=1731351023;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y9ByzT5rhkqv1UFXFeAa7XDWoMGVN9DTUnpFtsiZv98=;
        b=H+ZgG7Ne66dmsACEEVfNfI3qfmupGI5UHdVfPFBLx6gAQgo14RNALeNCtLZMNPPiz8
         DmLcixIVMz5iQUrLzN/8Syl8N1n9P0jlf078ArL7HPo2/zyEmijb+dJRTif08IK3ZHKA
         Q6pzItxlq35BVb1MIX5MrLNCjr+e47SuIPNhpNYGsMMncXjQ3QdHSkaOmb3qb5c5Gq1b
         jceOgRyXQSDzZ2AVlpW14j3rbhfqADf7UvVrdQMDoDDTZyeyy4fkC3g0meWT+kezWGvn
         pEJ/6vMOoOdI6FdWpo6JSPeghBH+WI66MoZJaBf8XwkKeDGa/5bdb5nxfzLXyoIKHf12
         JLqw==
X-Gm-Message-State: AOJu0YwWIWFPeqny9zCnsGZ4w/RzOHyMHyYMHXLtTev2IXxfD69mdMaL
	nv4VvawqwKHCwLmmrt6GOrJlsicJdSyMrWwX1n8GSkm+KQXle3f8JCfwqLwWNoYFomQTDsCnrA8
	gZnw=
X-Google-Smtp-Source: AGHT+IH49Bn3FifJ33FPD5Gz33gFu44F9HIMX+OnVbzafXRnP5Wsu0eGXm5Lc/0fHXbLXgtkonLylg==
X-Received: by 2002:a17:902:dac6:b0:205:8763:6c2d with SMTP id d9443c01a7336-211056b2c5dmr236699765ad.9.1730746223147;
        Mon, 04 Nov 2024 10:50:23 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ef03bsm64652515ad.37.2024.11.04.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:50:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: ti: driver updates for v6.13
Date: Mon, 04 Nov 2024 10:50:22 -0800
Message-ID: <7hplnaomtt.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/drivers-signed

for you to fetch changes up to d8ee46b226ace0110f82233ba4c06ff1742ae443:

  thermal/ti-soc-thermal: Fix typos (2024-10-04 14:37:23 -0700)

----------------------------------------------------------------
soc: ti: driver updates for v6.13

----------------------------------------------------------------
Andrew Kreimer (1):
      thermal/ti-soc-thermal: Fix typos

Jinjie Ruan (1):
      soc: ti: smartreflex: Use IRQF_NO_AUTOEN flag in request_irq()

 drivers/soc/ti/smartreflex.c                      | 4 ++--
 drivers/thermal/ti-soc-thermal/dra752-bandgap.h   | 4 ++--
 drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h | 8 ++++----
 drivers/thermal/ti-soc-thermal/omap5xxx-bandgap.h | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)
