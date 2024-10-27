Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC05126BF1
	for <soc@lists.linux.dev>; Sun, 27 Oct 2024 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730071904; cv=none; b=n3R5QpOYIyOAB6rWwhH8/K9l6PdbtEAT2PAj6WcFVMqk/WkzW+2B8xHxMv9hdJSTDQB7Dz2iu2N+yJkGgZZ7oWWEmw62ZvahVVMd9CAqhN56SpPXqE5H6CUZ6UhGBY3jgT82JLvYtDrQg2N32k3j7KImr7pGd+JdVLKQJYuj+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730071904; c=relaxed/simple;
	bh=jwjn/61q6vzgnaw8czf9Nb8oMQOKAjZP50jDFJAI1UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6HBgl+WiZ1GPtTh9QHJhbtpeNSBcEd2KpfILbGr/1Tu40wyd0wDn2pIB0oJae06uR8gX8g+328w6rIebgQvAc6MVi7iR5aykinIAkH0zcWw5XCseGp1ctKMpY9ALk0uWoENx8g0O7XelcImnIeu+63b0ET2BSdyPrIZaORk/aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 6D8A7C4CEE8; Sun, 27 Oct 2024 23:31:44 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FCDDC4CEC3;
	Sun, 27 Oct 2024 23:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FCDDC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Mon, 28 Oct 2024 07:31:39 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, soc@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241027233139-GYA86372@gentoo>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>

HI
On 07:04 Mon 28 Oct     , Yixun Lan wrote:
> Add myself as maintainer of SpacemiT's SoC tree, which
> suggested by Conor [1].
> 
> Link: https://lore.kernel.org/all/20241018234615-GYA2124001@gentoo/ [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This will setup proper maintainer info about Spacemit's kernel tree,
> which should help to take soc and device tree patches, and send the
> pull request up to Arnd's soc tree.
> 
> I asked Kevin to host the kernel tree under SpacemiT's account
> on github, which should help people to get access more easily,
> and promote the tree a little bit.
> 
> I could take this patch through this spacemit's soc tree if no objection,
> of cource, after got ACK.
> ---
> Changes in v2:
> - drop RISC-V exclude dts
> - add mailinglist info
> - Link to v1: https://lore.kernel.org/r/20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb3347d649855992a559e3526d18443..88fe4ca801537eff7eb5001406a611ef80632b5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19814,6 +19814,15 @@ F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  
> +RISC-V SPACEMIT SoC Support
> +M:	Yixun Lan <dlan@gentoo.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git https://github.com/spacemit-com/linux
> +F:	arch/riscv/boot/dts/spacemit/
> +N:	spacemit
> +K:	spacemit
> +
strictly, I should put these before THEAD section, to keep it sorted
I will fix this while applying the patch if no other comments received..

>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
> 
> ---
> base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
> change-id: 20241023-00-k1-maintainer-46eb3f31e6f2
> 
> Best regards,
> -- 
> Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
