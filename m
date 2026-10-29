Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247807;
	b=Y+FnSd45MF3J2KLljLy/OetCIExrAOV/3htNlx6v0dgEQU1oocK9O5tHfgZM+CG6zhxt
	 mZRLPh4zFd9QDtLeRmu4dS3neEJAZXZs0/9aVpb0KYsKyx2UyXWGIThx1g4u7WbyC18i4
	 J8Z5cXEUH7N+EYgGn16YLhq52t/IhK/257EKHaBw5ucF/i5XuEkajReuJZHODwjQfB4jn
	 shW+Fy0PL1NxC3bAJSDymNWYkQZYjqwVAYA7JD6m1reNkasF6FRjfa6GEXsqrsAIof7z9
	 jI3Lv+ypaZtVMhBfNe3EIErUeDQ6rhB0ClacHB0QHm373ivYrbw2zBamI+oFe1/USEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247807;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=WY5wnUr0YMRLXTa+IeVdTK62D3adKCL9XnatFjihAzk=;
	b=ksLrZAFL92/XZIJpeZWzsdVufpr1O8mhvSDZ3tY1t053BIPlcObT02ZHxSp6YDlKiY9B
	 ZrEqsMeTlqSElzdBGlEiY+dPKGSD8AQKVMKeOEolCQ3LkF9QkkwMX0n6wv3zbwnurAEQV
	 DBP8jEij/iS5MI6bkEk07XPVcdkxKyKK67HM6/9iTtkDhe8mVaAhNinJReqDd4v2obNv6
	 WCZnKvxY1hXeJvX9mzRZ1NnKhWuZLa3IAptXEzcRImGLOAgVcWLf+w0hpmETkvDII1hP3
	 8/xW8Nbkq5P0RftqxXNS38uBmZfcMi3anCndOqGm9NtlydSm7a0tCMiKnW+xXFlDWyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=OKYVWu5I;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F958606A31A
	for <soc@lists.linux.dev>; Thu, 29 Oct 2026 04:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F958606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=OKYVWu5I
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id MFQxxySuiaC0UMHfhxwv8s; Thu, 29 Oct 2026 04:23:25 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MHfgxRKBjLr2uMHfgxcvav; Thu, 29 Oct 2026 04:23:24 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae2ca3c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=MDvQDARPIxcOL7T4D4kA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=7h6zrudLq975CqBWz9ej:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WY5wnUr0YMRLXTa+IeVdTK62D3adKCL9XnatFjihAzk=; b=OKYVWu5IWjJ697XodiKp8mPZMo
	40q5C15s3gWM5WgNuKMhIM/I/DdoMBnOZEVTC4mZJ3rkZlUi7YFnmmP8ZdHLwRMtdnYHiKr0axDhw
	sUjuhm3tLAxeIUsdw+3B3FOF+jOOQVcgrqx3+4NWXrsA3nEJJD1b9o/AtIzVSlz5kAbonopoGfsbz
	UL54DZdn4m6hRNDgMWbBfA3yWRIoYCm12+9AKRzH7Y+fTxiEuV92MZHtvHRxSaqcpzx+T448ao3Y6
	TL+lmTOJOACd4tLbeMYHz7xc//MaZ2ZJxWVm2+VNJbpRo8YnOb1T48ZuDrcXD9c0mnrEE1sOlrg/m
	RJzWpe4g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53758 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMHff-00000003SdK-3t8p;
	Thu, 29 Oct 2026 09:53:24 +0530
Date: Wed, 28 Oct 2026 21:23:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO
 controller
Message-ID: <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
 <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMHff-00000003SdK-3t8p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53758
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKXkocQe36ZvzO3nby330NP1eyglu9X3wt6ZjurYu4MW5zjwEYmoPdyLGS31WV5OEMcqcF8X+nac/quCo6ONQFKMaAB/WK3/WGTiX4Lnt6PvS3l1PJsd
 igJWmPj4W3tLKZXhv4QwOGFusKs/Z3MDyviS+qAHWxDQzN4E1vnGROW2GYG8KysYDC+LYHeW5vbU7PQYqnQbJegNamyA85YkpGw=

Hi,

On Mon, Jul 06, 2026 at 08:14:00PM -0700, Dmitry Torokhov wrote:
> Define and register a static software node (sa1100_gpiochip_node) for the
> SA-1100 GPIO controller during sa1100_init_gpio(). Assign its firmware node
> directly to the GPIO chip prior to calling gpiochip_add_data().
> 
> This allows StrongARM SA-1100 board setup files to reference the SoC GPIO
> controller in property entries when converting legacy platform data to
> software nodes, resolving pin bindings directly via the attached firmware
> node without relying on name matching.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

With this patch in the tree, the qemu "collie" emulation no longer works.
There is no console output.

Bisect log is attached for reference.

I am not suggesting a revert if that is even possible, but maybe it is time
to retire collie support if no one else reported this problem.

Guenter

---
# bad: [c03c1a14507dfaf8b856c2608f9ac216021fc222] Linux 7.3
# good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
git bisect start 'v7.3' 'v7.2'
# bad: [4e69c1856bfd9ffb7e9d335a25842fa211628929] Merge tag 'drm-next-2026-08-20' of https://gitlab.freedesktop.org/drm/kernel
git bisect bad 4e69c1856bfd9ffb7e9d335a25842fa211628929
# bad: [5a8cd539ac19f7a68e68e1d25ef9ca2ff55b8500] Merge tag 'bpf-next-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
git bisect bad 5a8cd539ac19f7a68e68e1d25ef9ca2ff55b8500
# bad: [abea5c349368a683e40fdc2e745099aaaacc89d7] Merge tag 'i2c-7.3-part1' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux
git bisect bad abea5c349368a683e40fdc2e745099aaaacc89d7
# good: [bbd0571269b5a17bb0685fc30ea0b89b950801f5] Merge tag 'x86_cleanups_for_v7.3_rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good bbd0571269b5a17bb0685fc30ea0b89b950801f5
# good: [658ed6d54e9775a627662f152c8e21509eea68c7] Merge tag 'dt64-cleanup-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into soc/dt
git bisect good 658ed6d54e9775a627662f152c8e21509eea68c7
# good: [368cf60c36a3a311474de08e52dc6314df3b06ce] Merge tag 'soc-drivers-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 368cf60c36a3a311474de08e52dc6314df3b06ce
# bad: [1be05c6afbb2c4052d0a13fc91ddcd89aaee9614] Merge tag 'input-for-v7.3-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
git bisect bad 1be05c6afbb2c4052d0a13fc91ddcd89aaee9614
# bad: [c36a4991e231242c04141536718d47255ec80887] Merge tag 'chrome-platform-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux
git bisect bad c36a4991e231242c04141536718d47255ec80887
# bad: [7c8af4b5b627d8bbf88c6783db49c52dd6b43f5a] Merge tag 'imx-soc-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/arm
git bisect bad 7c8af4b5b627d8bbf88c6783db49c52dd6b43f5a
# good: [809177dbf32e3c649abcd027334dbcfe34720446] Merge tag 'arm-feature-deprecation-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc into soc/arm
git bisect good 809177dbf32e3c649abcd027334dbcfe34720446
# bad: [ab1c3ab445b44d6b412bc4f7fad3db4f3857a80e] ARM: sa1100: h3xxx: convert gpio-keys to use software nodes
git bisect bad ab1c3ab445b44d6b412bc4f7fad3db4f3857a80e
# good: [9212f660d34c385f2ba8ad5fb7b94c1d45c166cb] Merge tag 'ixp4xx-arm-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator into soc/arm
git bisect good 9212f660d34c385f2ba8ad5fb7b94c1d45c166cb
# bad: [ea07a154791e7e95525f843beaa72402a4fcf88a] ARM: sa1100: assabet: convert gpio-keys to use software nodes
git bisect bad ea07a154791e7e95525f843beaa72402a4fcf88a
# bad: [e4671f292ebb363fdea08ae3b0cd18ba7a2b486f] gpio: sa1100: register software node for GPIO controller
git bisect bad e4671f292ebb363fdea08ae3b0cd18ba7a2b486f
# first bad commit: [e4671f292ebb363fdea08ae3b0cd18ba7a2b486f] gpio: sa1100: register software node for GPIO controller
