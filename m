Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8926059D
	for <soc@lists.linux.dev>; Tue, 14 Apr 2026 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184844; cv=none; b=BQkvJ4EOVk5MPzP5EntDEgtAEzaz4oVLj1GsVoz12xZjCSw8SUxOZ7scRujLdN9LPfd1/8hC7+S/q950ZWiR/RQV0tGEEZkYykOtJQuB14tljYz+y742NGrFEGHmjxzHX5V/JubRusCA4QuF8j6QvJyaaMquKWVK3VQ99sPb+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184844; c=relaxed/simple;
	bh=bWAXhLUbOAxRun08ft9x+2N6DT+CKZownG9+NFBU+44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO3XMw8XcpfgrzUkydP9ptbvS2IqTSKD3ctMMifaiFajarVHnKQgP2plva/ECY0RsOX8IP26MAoBCuQ6Qm/gNzTJs9UxaGZ2FknVHr/zzfj/N4G1KVL2VlW6WCOIVk2OuY0gtFa6nKnS/X+TQD3UO2OrsfH3s9gzCqetqdp9/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0NJToNC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0NJToNC"
Received: by smtp.kernel.org (Postfix)
	id 7CFADC4AF09; Tue, 14 Apr 2026 16:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14C4C19425;
	Tue, 14 Apr 2026 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184844;
	bh=bWAXhLUbOAxRun08ft9x+2N6DT+CKZownG9+NFBU+44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0NJToNC8IM3A7Gfb11U42v4H5AX1/j91q+7QO8RTBVN7NaixHAs9VVeZ9Q7GQXA3
	 JEyPTVfX0pe9bOwvtmlSaCXBa8oDpGfaeUwgGtEIPMT8FNBIeKKtNomtN4dHdSlSIf
	 5rFXgtl8eS8WCI6KK1zuCTTC/FRSoBh4o1YscYit28gqp1Od9EdlgzzHqN1VXegDM6
	 TtFnGHMZ+oN9EcPq3RgrcsKLSYAz9FUnh+gV+3yJ7RlhrtdoC9/eCZWGFGEIutZwVQ
	 2QXHuXN5ILA9COBkMq1Za3ItqstiShWpqBnXjjBocmud0BAYQ89e4lZyPjjzEFIBOo
	 2FajLzu2zTgYg==
Date: Tue, 14 Apr 2026 18:40:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
Message-ID: <20260414-nifty-conscious-fox-973b65@quoll>
References: <87cy072bho.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cy072bho.fsf@BLaptop.bootlin.com>

On Fri, Apr 10, 2026 at 03:25:39PM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v7.1.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-7.1-1
> 
> for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:
> 
>   arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller node (2026-04-09 10:14:40 +0200)
> 
> ----------------------------------------------------------------
> mvebu dt64 for 7.1 (part 1)

This was sent just 2 days before merge window open, thus I applied it as
late branch.

Best regards,
Krzysztof

