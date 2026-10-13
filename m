Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D937511E6B
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912184; cv=pass; b=X2Xz9bOc+D81/3JKo4GxzdFK7qoyVmJK++KH5Uh5yOfSwJzlkK22zE1lqawjo6pK42w68cCBhJ2ctVWytxt81RgDtFnWBtl/c6wITDMgk6rpNE35ADVTgvwDfQbYmkmLhX1cBZWLL6ctX554rgijqsp9CDrF5kEvhm+1O3ocamA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912184; c=relaxed/simple;
	bh=FPhD9ffWsuT6nz+M1b9LWG6gr1ud8CZdaBviPnSmlZ8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=p8b8n0TKbc6v53gPCLt+6dRtE6lLqBgGLyg8+FRu6/os2UQZoZyinCawZufZHDxuHH8VsFeFYwYko5xJlYEA+NzbkD0JAia/dXdkXNjm7lPChY5latZHzcge7IkUjp0nnR6nuOFcz2UlEPj9VzzH/C1dAfFbfstKMyCmdkQY6zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MqU5W01C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MXSUiBhn; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MqU5W01C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MXSUiBhn"
Received: by smtp.kernel.org (Postfix)
	id 43FA41F00893; Tue, 13 Oct 2026 17:23:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791912182;
	b=fVG7cQQN/IlbKOIyg4XS1SFK2+z0mDDRiRGU4y+652boLuF2TMoKKzTLO7cv7lc4YoQ3
	 76BoTlnaQkdPtyDGUbjucHhmDjWlZxTLgR3OJy8utpbm8XiSYeEkLeLXTeQZ8JoQ45VSr
	 AKL8JdfO8RzFPGBX8Gvw2gXuIekM755q+2HKcs9G2pAPlmlEMjPVOxCajWZVsQELrwVR3
	 E845zkJip2ax56p6nPNaEeKqKm9uCARj/pq6TF3scU0PXuZ2FJ6ujpxo9Vym2UBPhbxud
	 dHxBTRZ80ORum+1YOyjRg8WpgaF9VrCOUIOCmoOYCEct3AljVRgC2gsSt3MX2h8UoSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791912182;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=hS+qW1UQlVePGqIuKEKUuB6UIO/AI0dB5jkfcB1qbck=;
	b=zBwcjZwOAA3biPmOJv5rP3LmL4/uLirTE2lzTfO5cYEwTFJvqJRpBSTXJxmv3aSFjt3e
	 A3NUZwkGIAK8hOpegQZ1mDy271C+j4Bmxpoq0OqYO9TgxWV0zd3bB5WHcriZJgOr+YnVJ
	 M+7IzivlIDb8yRlzPJ/NLfY8vxifDroaBh3U+3ZciXCQAOb1XcIQyNtTlZDl2pKCoQbSx
	 16Ul0TlvLL+Zdw7yMcfR6uu8+49uA3a27PdEC1c8o4lAslRnHY2TGwXF36MM5lXaYPpzz
	 8MbXyvwbowEtYzWSIickEtyh6UsNbX7o0jjNU4n61ikoFLu42IpUgsyRwK+Iubvzt7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=MqU5W01C;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MXSUiBhn;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A95061F00898
	for <soc@kernel.org>; Tue, 13 Oct 2026 17:23:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=MqU5W01C;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MXSUiBhn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A95061F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id B337B1D000E9
	for <soc@kernel.org>; Tue, 13 Oct 2026 13:23:00 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 13 Oct 2026 13:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791912177;
	 x=1791998577; bh=hS+qW1UQlVePGqIuKEKUuB6UIO/AI0dB5jkfcB1qbck=; b=
	MqU5W01CRjiCM9rI8jQDnsnpQOhXvs2twy2N77PTz7GpiFFJ1QYLw2PGcN27rDqV
	82o+dYLcrfjQc1jGo3NEbcDNL0t7MT0n9qdWKAiax/JhRs/Y/G5T+dMFNUpPDwNH
	dtGT0dgEo+ZXI5pAu32v2HD+mUeytpjDDAg/HAw3bldSw0xNBNNyV5wIG/Lyr1YD
	S/vAfH2Yru32MLW7Y14X3Vc0HTSZLUI7n01Kz0HlTNCUn/oR5gW5YA8wvwBQjRKy
	s6uNKCFWEzmn5rzCm5N2QyIjEbeGq49WOM1QHYT/eG3HSQS0PJlCQuEZCuHDfSUC
	h00pW1u9gxd5Sx6jcrE89Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791912177; x=
	1791998577; bh=hS+qW1UQlVePGqIuKEKUuB6UIO/AI0dB5jkfcB1qbck=; b=M
	XSUiBhnWHuQzwhGDm8nsaYrYVCseWnABH4XdT8pIANkyjhQfTdmrOgeEq2ol9397
	7p+96ZZfMMZCJZwz2XgCjnlVnIqcQSIDHaz7FnUd0u7Vo1a0kjQg82jv8fAArurG
	BlLaRrlYfOUkc/dkz5HUkxAVywyZD6WwkVGZ76+A508QI/O7vCctCzvIJCIDkB0T
	cTvHI5/p6OsQEdcMUItPiDiS4GZ+krFuBr5a3+q/zIok4rdDkQv+P1wclyG4a3dq
	pOzkoeU3huWZdYXTa5zefnFgTMzt7dDJ/4RG3QLdTyOU8fLrLYWfcPcg+j3gf3/L
	vGfyQN7yJA313N38MNLZQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791912177; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BrZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:DUj9t7Ecx1kZN9o+3Pdo19UB0fsBRL3ZYhnxKf1+YOqZLLA
	Ztqd/gi70re2mgoGoBtphDvM8agEfw1Qep66gXN3HU7R41/slikoEblFfWmzlnjN
	CqQSR/kIwIVtKhpNY5n2GURp9Mwke55cIgLnLZeJBThvvgbe4mI70goDRzUM7USQ
	aZpdpzeavbPlfwOkWzNEDxnBqkrdm2ZNpvathffYxlM7SCX+e++BB46dSiB+Kgoq
	dtQNHGi5o65b0bgaseWUQlfkPDD2rl5oMK+RyCEbu46cvu+eIFzSb6gsC5vTWOf+
	zx39u+Mf58Ppj9B+JWWqkpOL5EctDUVdPe5Dqkg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oZom5o/iezk5oczVBlgZAdby/ePS/EmvxfPVKjfndZU=:FPhD9ffWsuT6nz+M1b9LWG6gr1ud8CZdaBviPnSmlZ8=;
X-ME-Sender: <xms:72jOahNNMSXZR0T7sW8fbo-qtEKIM7TmUjzeTc5XxvJnPkj5vIQ-OA>
    <xme:72jOauy2T4Q4zFTAgVPRT4U_dyBbL5t90_TEfA76-wCdoGnYk8UuRtTuyl7pf4pkX
    T5ZhxW9ziFDHQpXl4Lu6Ao2CaqEVcSAqyoujFjyPYibGUKiCN2hmfdn>
X-ME-Proxy-Cause: dmFkZTER14THpZh+OBkvXnHUH8+jwzP/jo3zDW19YD/663+030AVqUF3ibyrM5gqg6OznS
    qN36Na38t0R/OlIEUa1di5k5DqlLqaEtO44cdxP3yuyOdDaSCJ++RH+Kw7XC8AGc9vG6xA
    LNjrjLuolzYXxuJUE3WNZJA9vX3leKG2KAN4SXvtlmeBcCeJd+uDdctMLXlvY5IEFUsX2y
    MMtdmyTx/gGugSyLgjiftgztjrUykNVUlm48UkS9VLlCbe7H2rQJIkBmay1swYdKKcp9mE
    HbvGDbdyXT4QJ7i5g4WPqQAhw4j/tTVDnB/h3O4Sq18tnYqG3AQ+hjgn0Wev7JvxQlu5iJ
    pxKZAUiOtKLb5d9qkyqGj2ayesf6UtmIgIjzHsUxRQrtP4k0T+VMnu5EG9eKTZjy4a8A/1
    0xydyt8TsnhAl8rQh3QmjTTtGPkoed5JUgLnCXrUp5GKjFPbIY3cgtIjVYYnKuNa4edb3A
    aoDfxMDPoO05PUDdKiKn2jZ5vxSfW2KooWIE57T8hcRX6uF4ShaB0yd+M1VTIn9AEXKISC
    Sz/XHJXI93GjqQRCsHmJKaXuL/m0hYp7IkU9e3lDNlsVgyz1qEC8m9H/cVBQ0PX0jDokyy
    2rOxBW5LMyX0Dye66ilMDQK3r5FZMDGnJ6FI2D8iwrlBS1NGV2LqCmeLOfQw
X-ME-Proxy: <xmx:8GjOapP-1Hf3BV8okHkUe5NwRlpw5nlEIv1VbVCsEHLdPIv6dwv8pQ>
    <xmx:8GjOaohduAN1nM9tuoxNBsOVdLXMOsd6PSnR2m7B_Ke_knC5VaiXMg>
    <xmx:8GjOass7jtZQ1FUz6RSW3140Jmo0VyrzLmOueOMHJa51_V8eWJS6uQ>
    <xmx:8GjOasjY4H37UaxeUMh8qy3i_zuYHmnN6jlT-AGGTrxKinaw8P8jXw>
    <xmx:8WjOakJ7TJazOR1kQ_WHgD8rqsHy77Xo9zQPz1LPKR7OgMowAU3gE_tR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 042BB32A008E; Tue, 13 Oct 2026 13:22:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Ar0hN4MWufik
Date: Tue, 13 Oct 2026 19:22:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Len Brown" <lenb@kernel.org>,
 linux-acpi@vger.kernel.org
Message-Id: <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
In-Reply-To: <20261003095924.1370238-4-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> ----------------------------------------------------------------
> firmware/tegra: Changes for v7.4-rc1
>
> The bulk of this adds ACPI support to BPMP as well as a mechanism to
> throttle bandwidth for various high speed interconnects. Some smaller
> cleanup and typofixes are also included.
>
> ----------------------------------------------------------------
> Aniruddha Rao (6):
>       firmware: tegra: bpmp: Move channel initialization to helper
>       firmware: tegra: bpmp: Add ACPI support

[adding ACPI maintainers to Cc]

I'd like some clarification about the process here, as I see that the
ACPI support patch ee98ea41ee3f ("firmware: tegra: bpmp: Add ACPI support")
only has a signoff from both of you and no other review tag.

Where is the ACPI binding documentation for this driver, and who is
responsible for reviewing it?

      Arnd
