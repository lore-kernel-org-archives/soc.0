Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E970E273F9
	for <soc@lists.linux.dev>; Tue,  7 Jan 2025 23:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292261; cv=none; b=MPzL3vtzpnyTIzk+dios+bTMA/CL9NmMDRRwa5AM5AtDdNBRmKNkqbiPrvHLJxURhZSfc9Ihg4RcOUXhNjtegHuCdLTW/0V1lL74DCYUn7ifU2+2WykKcdmgEavNdAx5poI3hWwjg1gOSbVkhmsh0KhSvte7C1VwY7Hsx2U8ABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292261; c=relaxed/simple;
	bh=XtvxspD2p1BDn3Hn4iJ/jDDqx3/ZuS/4tIxXuQUrgIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=abUSZ3uzWLDWJ3OfoirdZgtf7q+juzdWm/nsvzr2h4bBq09dOeVx+01VjVPDKhiIHuvw4RtIrnJ6G1oIJAAV+doWvMYhzaPwyqeP+CBSi+YCrQbaFZXsubMbLTpaCfLhOv6qo4CjccDQ7z3DW9iLiLYd0iaDABRaGyYC4wJBbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HO7pDXsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HO7pDXsv"
Received: by smtp.kernel.org (Postfix)
	id A6E39C4CED6; Tue,  7 Jan 2025 23:24:20 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E293C4CEE0
	for <soc@kernel.org>; Tue,  7 Jan 2025 23:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E293C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2162c0f6a39so5500665ad.0
        for <soc@kernel.org>; Tue, 07 Jan 2025 15:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292254; x=1736897054; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C95iLiIsGMfRm8JaUNPnSGMtPKm42hHvd+zXsLNeXKk=;
        b=HO7pDXsvKdX9a5Sy3lGJqJw1LxCfKtPCgmoNXF0CgrK3ak8C/XulPe1ApnjzWVcQ15
         7A73PYu7UM29gHRexlXaC9hDS/HLTZ6KcCZWkUSNZYuitIIT7dunQrxSVJAIG1p/VZIk
         xVH8EDK4bwhWBAJBgV9iuaDTJke2oBnWR52POY6i69IsG8xnm0NaSwXZjWdEq8G1mmAC
         PX6B1M9rQJ5XBqFNb9g5Y/NEbqQmEh+ssH5ol0qIcfAs/ymwXh/9VpJ6SNcZjBK9gwFl
         j6lEJcrBNDqbk5DNlAnsySFYOhze92P9lctq3QKhMO+z+8D5fbyfFypHtV0fpJq+pZQk
         u2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292254; x=1736897054;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C95iLiIsGMfRm8JaUNPnSGMtPKm42hHvd+zXsLNeXKk=;
        b=OPxf0KVjS4hMop4R123TCFVWqRcjfJZaMiC3ZcGWDNVb6hfstsKccVqBAp3A62KHcS
         P3OKKa+Xkco/pCuvL4luqNEhCT++mWf+EAAa+i8KubPPNenosa56wxjFjQJpEnXnJDL3
         diQ8fqx09uW9kIfuUJXVVnZ7puYIWaoL5Vf1+yXb2KGpiu5Xw2GWx6Wid9Knx2+P/yk8
         FIQWJMb4KcZOmvc3uMiCKxHkMI31NrXgd+7uhMwzDuO+VKSa/PY/hvYy0v3YoW7bSBof
         EwdDwmlg4/mfxnhY+3aQD3nnOJrdX0eYPQA+j/nru5kPjAi2axJRdTsUqolJRMgks5qe
         hNTA==
X-Gm-Message-State: AOJu0Yz16Oaxwbq3tlbdv9vet82JQOOX3MglnE7iewEGD2fupdPiOsu7
	W2inK5FOaEG65UBz6l3HgiHwYljwscWZtaNQPLrOIDnTh/tKXq7Tm8WKSujMxN2eV/PR2YAo6MR
	Z
X-Gm-Gg: ASbGncsRB6UsE2MicD26NajYPHas/dfeoigB9aBrYenvU6Ll0emmDA6BIgorRtQGZfo
	OPH4U10zna551Ho3KWt8swOKLjf6WgBggMHtkoR4qbfVEno8g22pUl5aSPpKB5jXNWlzGZQ98wp
	CM95E/0UewLaeXrILwMdxGN19jMR+sN/oifwoX8iHt54GjQ/PDK4QBmAYp8zQ91c9Imh3y2Ao0+
	7Xsfgq/NMf0ahdG+ORqDRtlL1bYC8/AS0jl1tRFLWkFtRLNeLVg8Ng=
X-Google-Smtp-Source: AGHT+IFk3tx493nN+dN4Z7Nw7T6E/L7ddLbTtmpOE9XcEH2hMlTKjR1Fee5FPSBt78FPKRQiKwWsog==
X-Received: by 2002:a05:6a00:a81:b0:72a:83ec:b1cb with SMTP id d2e1a72fcca58-72d102a8059mr8370201b3a.0.1736292254620;
        Tue, 07 Jan 2025 15:24:14 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81617csm33872826b3a.39.2025.01.07.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:24:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: ti/omap/dra7: minor updates for v6.14
Date: Tue, 07 Jan 2025 15:24:13 -0800
Message-ID: <7hmsg2b42q.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/dt-signed

for you to fetch changes up to dd504db5cd4a4bb48e8b96159e23ece89bb54d90:

  ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties (2025-01-07 14:59:51 -0800)

----------------------------------------------------------------
ARM: dts: ti/omap/dra7: minor updates for v6.14

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
      ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

Judith Mendez (1):
      ARM: dts: ti: am437x-l4: remove autoidle for UART

Romain Naour (1):
      ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus

 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi   | 18 ++++++------------
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi     |  2 ++
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 16 ++++++++++++++--
 3 files changed, 22 insertions(+), 14 deletions(-)
