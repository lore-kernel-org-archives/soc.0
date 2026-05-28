Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39F264FBD
	for <soc@lists.linux.dev>; Thu, 28 May 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976854; cv=pass; b=d677F/Jtkf3N6MupdVaEqotUlgTNkPGzRTnqk+kcr73hTRIKyk4NGzHk2/hNIbg4nvmIOx/HRlTcjXGySV74aCTHKir3FJk3MCGIlGvtUUj5+Aqsv69JmSd4Hz83OEkl2Xi669Shq50oo0qDtwGaSNo3qfNnBQWtnG14sjWEZwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976854; c=relaxed/simple;
	bh=IRGG6yFi4P2BX6N9xbm3JUaWCBnu7kklo3+13wSBI/I=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HQDsdkbOheNIw7An/Y0UsIeyFGRBCJS4VePkiQswQ6Lga3OawGJ54tNOTmqlFnv3jS5b6DuK1vY2iFP6aapO0VCKA0JPZmutGWIfs5OUxRy67TdQ1W8a5dFOLt2Q4R4fkXwBsoHIhK3xB4Etq4qLt4R0cl7DYzcYaLC+VF7MY9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=K3xoHEtJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TcfnL6ai; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="K3xoHEtJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TcfnL6ai"
Received: by smtp.kernel.org (Postfix)
	id DD4141F00A3C; Thu, 28 May 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779976852;
	b=Glw6/+22P5cqtgzoeAk/BZcB0XzI4DrDgWEavFrNsYRYOm42b40TEBHDf/zkqXyQTi81
	 TJtWa/IqXhrWeM2HjM4eTCoPsNvO2E8Wf4VE3TPThItJtZR8wgPNFYXbvgVUqJjUyzHqT
	 pt2B9bkDl+3LxGrnNRrRWkfC1xprz0Tlxv9pGtYZeQ0Wj6KhUEiRECvZWN5czo5NcWwCl
	 oCihlDRoUvCaEnGNeYPBRZTYRn4bnxHn992RxSk0rATYjY/gVKJIZ8oXvy+WVNhu1uTRc
	 EldDA6s1/QJ7vp9ABIb3C3cC+OCcQdUHxBGRs8hz+skH9lQ8kpLSfMhbQ5ToxyYkv8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779976852;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Uf88EQ+6vPctaOIU6w0p1PRPhPZ1OcRgK9H2lUTVJqs=;
	b=dFKKvcT6yNBrRrGSgjiu1uEOxY2W94sf2CrYRx3swpg929xPalUuCRDOei+3hi9kP8sJ
	 UZ6xOciIFQfxNjPyEXKLuQbtGbdV+k8WVC06QQDiX3qHBray3cfk3ZYqCrVkJL7X3+weA
	 0PV/6ddsTksKi3e+VdvG2z7JtvWMkzqF91oRMEMQA9GJ908tppm6EESb1w0nYsToUagyi
	 mkkBaKpLR2iylyz2d/q9bEyGXwIrvzRMrXg7fHMZJ3Acs6D/RUQWrkpl6MQx6tvzXGOt9
	 8RWNoATi+fHXITNGZua0jMkMAAOBoVX3Crek2QhFsS/AzAlpbeWVyalnueNGvn3CJQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=K3xoHEtJ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TcfnL6ai;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B99FC1F000E9;
	Thu, 28 May 2026 14:00:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=K3xoHEtJ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TcfnL6ai
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B99FC1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E13391D0006D;
	Thu, 28 May 2026 10:00:50 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 28 May 2026 10:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779976850;
	 x=1780063250; bh=Uf88EQ+6vPctaOIU6w0p1PRPhPZ1OcRgK9H2lUTVJqs=; b=
	K3xoHEtJimykpbchBvmG6qRIpv0Qhp89Rd087woFcJCGNAKAttEYa6kCq4BktXxE
	AGfQbRzLKGMBGt4WOja8Wg7oaTAidXBPjNB2hy45ep4kulQwhTwilOSRIVN1VTp1
	h4WWWkwkpMNjaHVMMx95wlZ9O+0+cKmPKoNkVjRGPTJcFkRBiHdsEXEazdE3cYTr
	ztuKll967ihpCoPjIAMw7jSuP71cE+ztVyQd/7nRM9UxHu7Sn/YAMttmxWX4mGIX
	4S8g0J4Ubp7FXzVC6pqTiDWM63T68V9E63zXcEZRsaq+zvLs/+iuHUt30QnYmdVt
	4TMLlJr44jKDWQml2OOmlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1779976850; x=1780063250; bh=U
	f88EQ+6vPctaOIU6w0p1PRPhPZ1OcRgK9H2lUTVJqs=; b=TcfnL6aijA0MXapOM
	1h7eRWufiA8i3DWv6zSPVWUM7Gbbem0H2bJS9f7YsZTzDopTbK/3XmJtpSk+aeB9
	ksFmLeWrUMeBxRAVN/hBKhCf667LG8S6j6DppNo2cVRHzIOePCkqIJMlDVVOs78g
	d6TjntsDFgizO+qYgpJMEfjnWOdwLTSaGv9DvNtaLZLb4EthnL8VsSuqDheS9qTP
	X3S9cLRfYGAl+Yk2SqU+qkFY7Mk6DDZY0AO4lqdJwAlVWFor7UNblkkdnKUg0Rd9
	Nyw611vRKPb5tLg+2UOt46kh3bXXzfXQ4T1vDK9IyJvkeRgCBa+GHQ6hT7+8x/wo
	gtMCw==
X-ME-Sender: <xms:kkoYatdE4a3PctIHqPky9flkwEFh6otDb8PZCD2xNd2BBo444FJrwg>
    <xme:kkoYamBNhjAVhGtH4Hboq4Cb95JXpkuLM1ywITk3hlR0uYcQoSKMrJA8VW3lppzrF
    kxU0eDZnwsx6l-MwHX2kPvkAk_JwOCT4QO14paGn6-ubiTJPDc2QHs>
X-ME-Proxy-Cause: dmFkZTEvkUnYQ/Ul3kadVFY24IS4YzaO/z3A0db1plIFp5V23fwHtDb8JYHB3z3gG4DuI2
    pr8SC6LjUB/eTQu537dKdN/J42iBqdI7KxTHOO1eJCnz+dATNE3/3xk8u29K5KhJ8cunKO
    PvI0VPMs30JgYVwifyA5SU/n4GJzfGolpo0Zy1SpOdDrE4WZ8gJ1H07bbbMQHK2a8PgzEa
    RyIl02C4aYQNunOA7hmvxBbCUJIFrRJOTTRI6s5OWjHd2pLLHbbw2MZdfc5JXi/neekn+2
    yjU4by+8g7JVTnbeJB3t6etE0uH/ittAi5QBRH+s0SfNs2uYwB/wkqC3YralkOzUwNdeo8
    TVqjBm6HFadHUtsKuZV8hUH9vLxN+qMuZQfrGb4LR81mJU60ctaHQNBAcDm770UZUXujeI
    t+8J1d2UNB+orlKmVbHZuDxzWQHAMNwPqGm6iKM8Qf/ywwumyMofeNX7Nmn7SmWJwnmTK5
    qJS3TtihgGVGnVVImRVG701Sk914dTBq4t4nhpWc1BGS47neHl/d2HzuyLgZ52WLkFVNG4
    nqAKb+/ldl+n2F0AWxpzzzfocVYrwVcaP2TST7KsDrrFIhq0aUutiQNCE/9uXzfYI7NP9h
    8CXtTg7JuA4RNxoK+qBhNLoBCq/oQHC/78foVlnhIPdF0Mwu6q4QqbzDDXlg
X-ME-Proxy: <xmx:kkoYalf7cl65_ffjU6HOrFEFaaceGrROHDN8ZNGYaLMaimWltzTAfA>
    <xmx:kkoYapPNjIPkVdMKbcelXkcYLkeUiJRzlhC467Wf5hf4bbXRYDsypg>
    <xmx:kkoYasKPcrW0votkEUcnd3f7LPx_NFdkSeHZMl9n0hRUAIAefeRasw>
    <xmx:kkoYaqHKoRkdk44L5dJIZ6sJfspZFAbXBPH0Nryx7BibA8TJW24s2A>
    <xmx:kkoYasfmnv64xMhRrb8XyTCVjRbLWAw0dbpW4EqiUX0l4x3BD-k4MliX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7A47B182007A; Thu, 28 May 2026 10:00:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AKip3VoaYoV3
Date: Thu, 28 May 2026 15:59:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Sverdlin" <asv@kernel.org>, soc@kernel.org
Message-Id: <2ef808b6-6454-4bb8-a8ed-dfe9c4bf0ee9@app.fastmail.com>
In-Reply-To: <20260514174556.1678694-1-asv@kernel.org>
References: <20260514174556.1678694-1-asv@kernel.org>
Subject: Re: [GIT PULL] ep93xx fix for 7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 14, 2026, at 19:45, Alexander Sverdlin wrote:
> Dear SoC maintainers,
>
> Please pull the following small ep93xx cleanup for 7.2:
>
> The following changes since commit 8bb9429a291964ca7a2244f48a34e02bb862c95d:
>
>   soc: document merges (2026-05-08 15:36:35 +0200)
>
> are available in the Git repository at:
>
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/asv/linux.git 
> tags/ep93xx-20260514
>

Hi Alexander,

I just noticed I accidentally marked this fix as 'Changes Requested'
in patchwork without actually sending the email asking for changes.
The patch itself is fine but I can't merge this branch for
formal reasons.

Please send an updated version of this pull request, with two changes:

 - use a https:// type URL instead of the internal one (you can
   configure an insteadOf rule in .gitconfig for this)
 - rebase the branch on top of -rc1 rather than the for-next
   branch.

Alternatively you can just send the patch standalone.

      Arnd
