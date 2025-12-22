Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E63101A7
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397710; cv=none; b=CpZH/oNLWJm3niRIrVEbr2LGhpYDGBV2Pvuf7jWP6iQCbKs/UnoAQyhQPFz7Z5gg+NRFvjANB3X7oV5wFwR/RAqPrdodfsCiCPcRG0AIjC98KPY4qjKM3RvCp8to9vDlPsaA99OgplF1NBnjrMpjf4oTT7Uq+gWrjr5qG6HE4Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397710; c=relaxed/simple;
	bh=jnNN9OUQV/TDfCNq4eLmPfl7X2xj/3UHNE0Ln7EzDhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGvGe/WCcwpyYyCbusFupud2bb/KzdRgBqC1vhRZodYDaT72XamIGpDQryVo1ynSgDz9y8skoD2oRI7R03WXiKgYJ6hd/nn/S85grFCAL3cV2qynif74hyQbjfUZK+L4VuDpyX4gj4dwsoxkUGXYw71PGchBvfdLCLppXWTdNM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LitlLcjD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LitlLcjD"
Received: by smtp.kernel.org (Postfix)
	id 40982C16AAE; Mon, 22 Dec 2025 10:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09D4C116D0;
	Mon, 22 Dec 2025 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397710;
	bh=jnNN9OUQV/TDfCNq4eLmPfl7X2xj/3UHNE0Ln7EzDhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LitlLcjDZ9ye/HF6LppOF8gRpBklExwig3Ny52jFghRo0qc+Jv5KRHyu2V1enjC7/
	 2B6WbMaavuQPmm6Kw267QnVZ1l10qruYRuOQ8iXtCGcAD0qsvN3tqi3DYGMqjlKkzK
	 WMAb/bmcrW1uayNTcNtG7s7FnXmzt+d29lbGFYlNNfuGcjsAF6hR25Ir82Wb85F7O2
	 0yRzmkXufLTeRnCtDSi7qPWiqhzkuIuuNZurYmnHwEJMO7Z+G1T4GFqKss/rOPaDLG
	 KVR+5A5ng8euUZv3fUwws8vffC9wFInDK1JG7tY0dolVd8DwdrLQ6nMBvZWR9moGIe
	 UxphNDp4jLMOQ==
Date: Mon, 22 Dec 2025 11:01:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@kernel.org, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: toshiba: Use recommended node names
Message-ID: <20251222-lean-resourceful-barnacle-95cd83@quoll>
References: <20251216180055.2793215-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216180055.2793215-2-robh@kernel.org>

On Tue, Dec 16, 2025 at 12:00:54PM -0600, Rob Herring (Arm) wrote:
> Update Toshiba TMPV7708 node name to the recommended standard node
> names. Generally, node names and paths aren't considered ABI, so it
> is safe to change them.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.

Applied, rebased on top of my earlier fixes.

I took all your patches to my DTS cleanup branch, not to soc tree,
because that way I can combine with my other fixes. I'll send them to
soc tree soon.

Best regards,
Krzysztof

