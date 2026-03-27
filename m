Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1837C0EB
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612404; cv=none; b=havVuJrHolV+dc+Oxz9SsKilSb/6M8yXNkt9+upEPj3iHnZaWKRA3c09hr6n4C2WW2aGS7K8kIL3Cf4BSaWqztymyXoBI1eNV6XctYhK0IGiSQ6PJhak/MILl7ErQuRuy0gXwEkmtods3EGOnIpqz6cnkpc11CEA6m9/VM9s3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612404; c=relaxed/simple;
	bh=0Rc6QMs+lYNi4jCX1Pmmc73oJrF8z9ofWC+hGzYSaW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG/WP44xVDRrnIf8hU094Cwt77mC4PfrBsOdxOKhyEtCT4LUX+rv4SrhIvr6tePeOKjYFb9sHAn5j6ajxBqKZXDsSymOH9xHsgMLBMI5feMUGggb8mGJ4ovy9aI2Q28LYCnPJf8zhTmL/JBIJ1LI0rf3vd25EWrNziM20HVfwI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJTUcxJh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJTUcxJh"
Received: by smtp.kernel.org (Postfix)
	id 47FF1C2BC87; Fri, 27 Mar 2026 11:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C310C19423;
	Fri, 27 Mar 2026 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612404;
	bh=0Rc6QMs+lYNi4jCX1Pmmc73oJrF8z9ofWC+hGzYSaW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJTUcxJhahvhGQtZ0KWLSiVfCsyWChBmsTnYv4iPgEF7NJR3yiwSmtAXHZM3ka0dx
	 uWaa7D3v/FcPCvFCnnMCCCz2ocFlN0VcZsDtDkGye08sr97RInghtUCgW65Yudpg91
	 wedZhzpOqSHiREk1XWMlEefBN13IYDI3v56/9iMHTzSYF5xy60strpZsZZqw9vS+dl
	 F7Cb9DXwHjBtCRKL7pC276LsDBpwZmuWk3AsPlOi3TA2Q+pl+227CRGZTlcMAhrrCy
	 nI80uQlnY4PKEQ46u/dd787GCfHiEDeOF5GGxlLXOSn4CuIPU6RNDySqN7u0DdagHh
	 9xb0d06Ocaspg==
Date: Fri, 27 Mar 2026 12:53:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Rosen Penev <rosenp@gmail.com>, 
	Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, William Zhang <william.zhang@broadcom.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de, khilman@kernel.org, 
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
Message-ID: <20260327-lurking-amazing-pudu-114fe8@quoll>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323190239.1890505-1-florian.fainelli@broadcom.com>

On Mon, Mar 23, 2026 at 12:02:38PM -0700, Florian Fainelli wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree
> 
> for you to fetch changes up to 220bdfcb4b4788f57faa2c28454d8b2dd3bcab6c:
> 
>   ARM: dts: BCM5301X: EA9200: specify partitions (2026-03-20 16:57:31 -0700)

Four days after:

Days in linux-next:
----------------------------------------
 0 | ++++++++++++++++ (16)

...

Commits with 0 days in linux-next (16 of 19: 84.2%)...

Are you sure your tree is included in the next?

Best regards,
Krzysztof

