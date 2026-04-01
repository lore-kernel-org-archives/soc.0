Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDE63C342A
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042337; cv=none; b=D03MTsBWSZ/r6+6DhxM9wM742GFUaNCNwCbMW72V1I7SIdMGpX22wd/KPjMd1RRvCbpuEmorwotLgNx+pwk0HZaMh5eQTLehatRBHRGho1QDACF86xuw+hMVxpuPpAKg00GZWdRhnFIZSIbdmNiDQ9IfazGexGDWpAac+c3S7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042337; c=relaxed/simple;
	bh=pqNx+XdtPue5P43Is5uBQ98Y3Hnw2hNKyF4NnEidEuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apk1wIXF7uxQ+ZzFfCdTaYLh7pw8SrWLDzwgR0MGr3NpRNMUiFY128KbiD7TmkHmKVZ57bwM8bX2kyN1IF9UqylFm6AFi+bLsAVu7yMZ4V47sYZ3JkHFw/+zlfz+3nEVRdCq7Pb/isDoemtQP598ITkAZ3OUGS7SsghBItExq2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6oS+Nyd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6oS+Nyd"
Received: by smtp.kernel.org (Postfix)
	id 11FD1C4CEF7; Wed,  1 Apr 2026 11:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FBEC2BC9E;
	Wed,  1 Apr 2026 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042337;
	bh=pqNx+XdtPue5P43Is5uBQ98Y3Hnw2hNKyF4NnEidEuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6oS+NydJKP4lXpWPkASVFtY5WXa0O/JO/D/heCZxpU+PkyKjeKDmEQLCroEgRlMv
	 HJBEFEom5beps9aXJNLv1+B+olD1ahAaW/7+ztVrWTb4LT5swNtakIfoZP/FkaIATL
	 7TKyFL3a/yiGhHBOu30hu57nD55Nn/LWpJVTaD6bkr7/GwvcINdILaERDKKszoss7W
	 W2jKFzvmcKvea97oBFB/xFSmDUraaTVYmilXAtQvPqGgBaKREh/aK0u8WWTpYM/DwB
	 dP864TdNZ5Uash80Rrw6l6vwmNql6I8rZWmYGoYc9aHkFeQ8+mQP+lqkMvDD+sSROh
	 8IeaADUWM9plA==
Date: Wed, 1 Apr 2026 13:18:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Rob Herring <robh@kernel.org>, 
	Gregor Herburger <gregor.herburger@linutronix.de>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Message-ID: <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323190239.1890505-2-florian.fainelli@broadcom.com>

On Mon, Mar 23, 2026 at 12:02:39PM -0700, Florian Fainelli wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree-arm64
> 
> for you to fetch changes up to 0acb1de2b4df426a62dba33bcd80f3939636f97b:
> 
>   arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level (2026-03-20 10:17:30 -0700)

Patches were good, I wanted to merge them, but then merge complained:

	Can't check signature: No public key

I refreshed now my keyring with kernel.org and the same.

I think the same issue was last time and repo is non korg, so nothing
seems to improve.

I am moving on.

Best regards,
Krzysztof

