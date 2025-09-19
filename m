Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571072BD5A1
	for <soc@lists.linux.dev>; Fri, 19 Sep 2025 21:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316804; cv=none; b=jMzuQ0u1Xc3jgQlCCzWJJYRUOaJLQtexAj+wdqqz0AHb3CenDQpmIgmNKGMjz/mIeTATUqkxhRad1zLybkg6jlArFroW8309c8YyoUrE0/AAZJkDOkTbIgTpbuyt0Vk185nmqMfcG3FCr7FTUXKUbWdxbFIutEGQKD0Qvu2XrN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316804; c=relaxed/simple;
	bh=7rpTCHq0tg2boyWWPz+AlsNfcsmC/Bi2r7ZhyD96jfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JwQx9Basu1pdf1Yz8Kmq9bN191S0ygBOvUjR6PFvjFSJBdffuM2SKCBN8iJ1whqSQa9mwQ2nyxSoGX7kE4myW9sm9ogjiB/FuJF00ITGG0JklyY49y6zklVYTtY1742nKyxkrAXS1ASURKw9SenPr9TQPHspgJWz1PsSd15F34M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GksNX5y4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GksNX5y4"
Received: by smtp.kernel.org (Postfix)
	id 14562C4CEF7; Fri, 19 Sep 2025 21:20:04 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9A84C4CEF0
	for <soc@kernel.org>; Fri, 19 Sep 2025 21:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9A84C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-42485372dc6so7312385ab.0
        for <soc@kernel.org>; Fri, 19 Sep 2025 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758316800; x=1758921600; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s92tP4t5WFXZr2GKT9tyo2yphzIt1odXMwCHBG052no=;
        b=GksNX5y46Gy3Fi1zGSPSUe9u7gVX0N5Hx38ZoGDiX3uavVMeoiTa8oLv0IzcF+JFnw
         YonZD6mmA7bU/vp5tzD7kstPjK3xARIKj9Cmi/pYS21McRnDNGdt7KO8tCIcDRl95s0N
         Q+h8g3IOt74AoXUlPjJbOCgyyQYI71FWQ9QD0yO8yaLRE0hq8YxmTkz0eZkplmEYhiG8
         FNHNsy9MZVDB5APPTfWf22SgapLY1IwR8kVrP9byANgAaWLUgyAhcl6x0DuT+RhyqIQ5
         jSC7bhXrleVS0hUMuuby4FKmrYJO9yrH7ixHuJrE8l6EsBBDv1raGvCtfJnd+k5He7NP
         sNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316800; x=1758921600;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s92tP4t5WFXZr2GKT9tyo2yphzIt1odXMwCHBG052no=;
        b=uPbZyaPPa6x82r9ii+zoc9SQJukx6pKrcbgAbl3ZS3iTg5xlc4rwWdfo83ftspRmAV
         6dj7sCMvczHU+1TzWb4xCmmSnxhD1fk7iIlRdN5xG2YBVeKriwLtpQ7emquWVWuAoW5q
         t8v/saNtnwBd9VHutYiPTYFdjPIgNVqMhnryR1SpkD7teD87Y2uaH5Vi2ae59/RCRkIB
         gYiuRexO0OWdsmH0HueXWhII9V5KgjqenEcrDsz80P0nPTrnGg09YSUCLPhz9aj0F0e7
         KFGBqzxjsYI7gUA2L+s5Gbu9I+nZK+8rLbMmxICapgUlW3nBnD3jYet4qUMNEsmC0Rdj
         QAHQ==
X-Gm-Message-State: AOJu0YwfoHir6k+QWX1DXYZvqSM/jzkQMfQbgctInV9uBLsjyW+8yN0i
	mwyP5+uQEEsJ9KWhi6q82sWsUIzq9oeyyKGS7peTZzWJjs0m0lY7yatle3jUhZOhLfMYHn7ONP0
	7VuW6YWtLOg==
X-Gm-Gg: ASbGnct8r/4SpZGmb1EDY6sNPRCKPEfaJ02I6ZlnriT6qkc4/zlF/twGNyEfnQhhd+l
	Er7ZJNKVW3BXM3U5vOrg2HfpxPyY7VWNtqIpxSJLs9BToiKjelamBBNZTCdfLeHY8vwQi3PNOS1
	9i0SISCmubuZ1NzmDgI46AsmotYCic3vG2j0uDjk9F+A6WhFK+YE7ywBDcEsboH+f8lsgQaYX2P
	6UVlcLK+lLiXAyGAVvzsGNscVodsq2MkKKH9t5T4F6cVT/dTr/1Zuzhz6XjyXXj35kBSU5H6J2F
	JrUTFsMy69/oZen5kFaNIWNytYkeesZIFYjP8wYJ6tCV6pQ6P1QUE/9vciCQc0rmjD0/A9UTC2q
	ulirKH/FTlQEXqNyA1XhqxDTVu3vOQHSLLF+TtYGasvzZqzRPHCnsAmptWQ==
X-Google-Smtp-Source: AGHT+IGsqsYnhTXUsNgx0wZHnvpKnyrcoUJXU5jyFCHL/FXVHe31eOcLv4p90MIR2Gxa352P4Ejr1Q==
X-Received: by 2002:a05:6e02:4813:b0:424:8650:17ba with SMTP id e9e14a558f8ab-424865019f7mr47008285ab.27.1758316800610;
        Fri, 19 Sep 2025 14:20:00 -0700 (PDT)
Received: from localhost (static-23-234-83-233.cust.tzulo.com. [23.234.83.233])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d56e41e3csm2599947173.71.2025.09.19.14.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:20:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: ti: omap updates for v6.18
Date: Fri, 19 Sep 2025 14:19:59 -0700
Message-ID: <7hbjn6p2bk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/dt-signed

for you to fetch changes up to 27322753c8b913fba05250e7b5abb1da31e6ed23:

  ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property (2025-09-05 14:37:57 -0700)

----------------------------------------------------------------
ARM: dts: ti: omap updates for v6.18

----------------------------------------------------------------
Bruno Thomsen (1):
      ARM: dts: am33xx-l4: fix UART compatible

Jihed Chaibi (3):
      ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal property in DTS to use correct boolean syntax
      ARM: dts: ti: omap: omap3-devkit8000-lcd: Fix ti,keep-vref-on property to use correct boolean syntax in DTS
      ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property

Krzysztof Kozlowski (4):
      ARM: dts: ti: omap4: Use generic "ethernet" as node name
      ARM: dts: omap: dm814x: Split 'reg' per entry
      ARM: dts: omap: dm816x: Split 'reg' per entry
      ARM: dts: omap: Minor whitespace cleanup

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi               |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts               |  2 --
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts          |  4 ++--
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                  |  2 +-
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                   | 20 ++++++++++----------
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi    |  2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/dm816x.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                     | 14 +++++++-------
 arch/arm/boot/dts/ti/omap/dra71-evm.dts                    | 16 ++++++++--------
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi     |  4 ++--
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts              |  4 ++--
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                    |  2 +-
 arch/arm/boot/dts/ti/omap/omap4-var-om44customboard.dtsi   |  2 +-
 16 files changed, 49 insertions(+), 51 deletions(-)
