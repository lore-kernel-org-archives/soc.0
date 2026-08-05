Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B1298CAB
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 01:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891690; cv=pass; b=pHzR/rcK911nq3tNvdq0PfMBvHJcIMHE2+IQbX861SU1CNyztkPucDdVObAex3Yhbje526Ygy48h1IF6dBX9T/W0/WIsx7Luj7PWOy4Eb7pgvGBshs1NcB1yWQmepPHHGXs1DYzpr7TuwI/LCSUdh22nZVLaP9N/LqWMdjexpRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891690; c=relaxed/simple;
	bh=6B+rvSDc/PnF3Xd4qn2GBLURqoGngogDuxv3umlplQU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cv0flQ0C1mKEdYupxaPBJunRNRfgzjL/5cI0nSkO19OaXQdnGQin5prwCr7Y7is92iGeOU2//G2iGa6BGtG9AyKbH9X0el7BuBCTKvD353hDMu5tSVWLP/DCAGdkVeiSkC/HK7cRYCIbMXyCR+/0rqL2plkcrX5r91kVAw77Zy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oQYP44F6; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oQYP44F6"
Received: by smtp.kernel.org (Postfix)
	id B58541F00A3E; Wed,  5 Aug 2026 01:01:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.175
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785891686;
	b=mxV9GE5TVxF+pu+l9ZDSCFD59KRqtZ+92gPlzpoM++CuVnNsNF1CZyrV4QkgidDG5fsq
	 Ylc4cgGtH9+31tAQfJr+WG3ukuMoh/4bSFMrCrWbUd1uZlxWkxcKAk5+wW5rhOJOfZklK
	 T03AIpJbw1r8QVp3Vezcq8Q18coUQ073NFuDgrnwZ/L62Bnm7tLx4FRKWUOgHdeioX0Ld
	 P09eLECEJ4wWxMWxB9Un/9NenWXueXaZD0NbsFynSyoR+0AjeShesrQBqoQrhdcYNN5Qf
	 lnTI9TuPnVwVwjxzA3Au+6lLQ8QK4iWTJ2NeJFeWW/UbQIucw/kuI/XA94wanPdGY2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785891686;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:To:Cc:
	 X-Report-Abuse:From:Subject:Content-Type:Content-Transfer-Encoding:
	 X-Migadu-Flow;
	bh=wIHfopREpj63E+t8aIw2YnOoOYw/Ruoq0AuZz9xlk9M=;
	b=gAnLSjBvTl1FnPnpW2UBbWXU4HW2PD1jeN1pPEH7p5FHMDhyiNRhera2hzyKSLxYcPIT
	 qK6YPTftfEFpGA6XBnpDrlB3I+COE08lGd3dnItoQFXOnFHbRuEYSe1gcW2epBfqmkHgC
	 O1n3kRn/CJng+yxZglTsVEAqjZ9l6Lm6sbwRSRV+HGQa7bOcTT9lZJjAxYrqQcEVxpWTi
	 aFThGjruMseoisCd+aF3+0JEhkurTd+yJl1/9as2dPAE88wDOP5MLd8Q9/suuP0D22O1d
	 ygvBQYmmxfStG2qF1a91xjiyDbdf8P184FnsF6Ve2rYvfxIjsaDXOMYKux79iSnh3Fw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oQYP44F6;
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.175
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A50511F000E9
	for <soc@kernel.org>; Wed,  5 Aug 2026 01:01:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oQYP44F6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A50511F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <c68193e7-4917-4941-a461-b70ff9521dc5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785890753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wIHfopREpj63E+t8aIw2YnOoOYw/Ruoq0AuZz9xlk9M=;
	b=oQYP44F6FoHStEmYnwI5ikgmyxlg4rnWi9TtP56KrrYbr7LNNwCSQzIDFqGhN5TGMP6jq9
	Oy4BOiDNXe/eCray/6hLSwYBRhsfwtL7zfVRNiVgXF443Ns58WfRBOAl3VoZayOhGWSA0f
	54fDqvQJ9UbZNzXKaexRxrSVfJ3K2Ko=
Date: Wed, 5 Aug 2026 08:45:20 +0800
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 Chen Wang <unicorn_wang@outlook.com>, Chen Wang <chen.wang@linux.dev>,
 Joshua Milas <josh.milas@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
Subject: [GIT PULL] ARM Sophgo Devicetrees for v7.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hey Arnd,

Please pull this dt changes for ARM/Sophgo.

Thanks,

Chen

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/arm-sophgo-dt-for-v7.3

for you to fetch changes up to d5e1ea5b05fe62c296701251c628ced6c68a6a80:

   arm64: dts: sophgo: add initial Milk-V Duo S board support 
(2026-08-04 18:05:28 +0800)

----------------------------------------------------------------
ARM Devicetrees for v7.3

Sophgo:

Add initial support for "Duo S" Board.
This board uses SG2000(old codename CV181xH),
which is dual-arch, RISC-V and ARM64. This
patch adds the support for ARM64.

Signed-off-by: Chen Wang <chen.wang@linux.dev>

----------------------------------------------------------------
Joshua Milas (1):
       arm64: dts: sophgo: add initial Milk-V Duo S board support

  arch/arm64/boot/dts/sophgo/Makefile               |   1 +
  arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 244 
++++++++++++++++++++++
  2 files changed, 245 insertions(+)
  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts


