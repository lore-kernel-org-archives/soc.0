Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2A3815CF
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005430; cv=none; b=Nuew9uzdxn85EJ9t02Nc23/y0xP3+sczHilqugpfk1u85OVwauM4HbjlVgWtH6s5jh019eGAb0BUFi2stxxnURiZHnPtg2U1W9LPT55om9CPeOQQPrHYnA1KndzGNSV30QFBKPmlpBP4QLd4vnwF+nCcgiH+ZEcVA9XvAYHUSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005430; c=relaxed/simple;
	bh=9KE5tQsSk6VefpM3unTHJ1LJVHY8KNbEaW4hC0KLFX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yp+HaetJSDk2FKjVqE1XHIdXpQj1TP0ee+zqtARSBu8BH/iqb4qtkvn0YRvQgrZ1Mc69vN0QMN1xieuDrpG+vMDj33a/0k93NoZ42aCsCQfRwyu1M/vuPT4HnK5klp4IXxZ7BT7+uIOI7Y6JiRu1wUwSeWroAN3l6HwlttZzxK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT6BIz79; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT6BIz79"
Received: by smtp.kernel.org (Postfix)
	id 606771F00898; Tue,  9 Jun 2026 11:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504F01F00893;
	Tue,  9 Jun 2026 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005428;
	bh=e4iCZ2GB2DAP/jtWUuhXEpTanDN24DMTGAgyHy3foqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PT6BIz79OzZWACODFzb0CeV6fYUh2v5mwAJnGIsyqKeM2+80I6Hqt2FfxXMpiIGTu
	 zaMQOsyyfPYZw8dJj66gXMtTjk7OQ9wUrUunK6VsX2tYwXwyjvcwSm27FzzY+MRCKC
	 TMHqiukZHXUMdDXUO6T6+ws88L8766OVd5aQafUtd3KNOypEcAPh4iUVXR56rN1Nr+
	 iohu9job2JaeBBaB/MyPnx8y/Z47Y2zP0HFm7FG286vAeMw+GFxNnJ9I4lPzEPuoWP
	 ZGcbLoqI03n9t/DElZ8fVl6DL4KrV/x666h1f4WgZdsXuB7CmktfUb81tMuvcmqxqx
	 Se67S9F4s2m8g==
Date: Tue, 9 Jun 2026 13:43:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
Message-ID: <20260609-mighty-excellent-shoebill-04d7fa@quoll>
References: <ah3ZAPLzh8ORGmpH@home.wens.tw>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah3ZAPLzh8ORGmpH@home.wens.tw>

On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.2
> 
> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e565f:
> 
>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +0800)
> 
> 
> As mentioned in the tag, this pull request contains a change that should
> be shared between the soc and clk trees. However since I don't have any
> clk changes to send this cycle, I think it can just go through the soc
> tree without any issues.

But the clock driver change cannot be in the DTS branch. This should go
via clock tree even if it is one change. And definitely not via DTS
branch.

Best regards,
Krzysztof

