Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20DC1EA7CB
	for <soc@lists.linux.dev>; Fri, 16 Jan 2026 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547441; cv=none; b=RtHsSdHapeZdqsSHUR95+LD0cYG6T+I+G2mPtPmSfxHO+yJPFBQp9VJ84+blDIesV3Fx/azneonMUrYF/rhWHzCB4n36VzYX0xZOhfHuhXgvdo78UzncVC6pUVlCuUF0xVjebap+o6mKeMfHJVp6n1yUPaoJeu//tLuYJnkmV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547441; c=relaxed/simple;
	bh=dTjkvdHi6N5zUrVqoEL3BTUzmyloHroYC0K7BKNA1KY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GR3wZNXvtzT5O93gyrPmO0rnQACEvwRMUzLQP6w+hf3+T8Mhwfxl5XDrFXS8SX2fVGHinT8z2YUgQOO7Ev8Wb5binZ87BRDAR1BjRECsXN/KVNecx0o4++nQx9kLPLRndh8T1mQYTbtISfJY5x705D7yluxK/zVZVRrD5nqnhiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UDbvUbD5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VOYpX8DS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UDbvUbD5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VOYpX8DS"
Received: by smtp.kernel.org (Postfix)
	id 80655C116C6; Fri, 16 Jan 2026 07:10:40 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73C5EC19421;
	Fri, 16 Jan 2026 07:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73C5EC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 676E97A00F7;
	Fri, 16 Jan 2026 02:10:37 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 16 Jan 2026 02:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768547437;
	 x=1768633837; bh=IGpc9FEQsNC6xC3DkvgPkOuK9GtCVCXxnph9MproxVE=; b=
	UDbvUbD5zfEpoNxSkSCNvreG773WME78JNV8wxzOV1awZ5w8PY2j4p4xWHouY5U9
	B1fW5Uhoim0l0czOsd0vVpGhObZSFJ08NICSW5LsAx7NqoMRhX7CHsppUWb4jh38
	xUbHR/2GWSAG5am5fyHzeUm3jU4b70N3rTNL3iI7bZG0eZm49v+VglipxUKcTTno
	mNiZvg+vlwXBWJ4Dt8pdaqbBirPuRpKAUtpiwdkAGBvnyNtND6nCPASaw1VrFM3q
	F0/4y6H4IwvgPIPPanRxYcKbYOh4+04x6MejoF34CcL+HqmYZR05TwjDNBy5z1OS
	HkGlUktg+k0MnEz2qLiK/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768547437; x=
	1768633837; bh=IGpc9FEQsNC6xC3DkvgPkOuK9GtCVCXxnph9MproxVE=; b=V
	OYpX8DS4QznVG27xWSAM6CGadEiNSoz9VtB38tOHDNdeSCYid0r8lYFdV7odz8be
	/NIhpeUs+3vlIij/xI08LGpizPsqdhuZ6Yi9/2arsB3NB801i+IHNum1IE33Novz
	9GbWXuk7Levgh1UydsKbX5/E0cCiu0zx7MRwhTlkN3/5Jnacxqve6hbG7ftRR3Ku
	ipS3VweghCoWc+rLULmMMUGLAZZ3OanQwhloULMq66gRKgpO8tP35LG+rL6X2wZH
	48z4IkjgHhrwYkfbBe2dblwyxBxDX7MU0W0eOE2j56cTTb2BwHH8LBM7Q11StP+l
	UPHC14NoJynGiW1/BYgSA==
X-ME-Sender: <xms:bORpaXDdoQQ-TDOmTcvE6UtEiYQloIbrUwa-5UaAT21QppuQKg3yxA>
    <xme:bORpaYW8rIRlq0l13daZ7A4UFQj-h4BZqkyWn_a9jEd227kgkzan9BoO9d9ZsxGzt
    A6uQCG6JGBgwevcEtX_Tcq-yVaSDDqjqfgp99eNhwGWsvNVzhUsKrU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdekfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejre
    dtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghr
    nhgusgdruggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekte
    ekjeefkeekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrghdprhgtphhtthhopegulhgrnh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bORpaXih33Er7jWwmpogqf4Zsm-TnZAINJCNN9hovBzhYkUb_BuxKQ>
    <xmx:bORpabeHuwNuDxjg3xXLxkXLw4-m4mh9q0hXqN9IdzBeJaiwcI48mQ>
    <xmx:bORpaUc7-RXO3e-hvbzLra4qkMbcQNWN1qS-hY57HxWPRaIOblppgA>
    <xmx:bORpad-KnmaqIinXtUAgvhbVg_QlZsAqMU6a32wVng-RV7E1mZFiDQ>
    <xmx:beRpacA12HC3XwvTtzI92xXbuOvzg6UyA2hGabsnfVAeqj6vx-JTEebQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CC28E700069; Fri, 16 Jan 2026 02:10:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AkxkLsOYWZOB
Date: Fri, 16 Jan 2026 08:10:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yixun Lan" <dlan@gentoo.org>
Cc: "Yixun Lan" <dlan@kernel.org>, soc@kernel.org
Message-Id: <200d8521-18b3-4737-bc8a-b52c74a51674@app.fastmail.com>
In-Reply-To: <20260115220918-GYA35965@gentoo.org>
References: <20260115-11-maintainer-dlan-v1-1-64bb698da846@kernel.org>
 <176849655702.4073327.9660735754248107368.git-patchwork-notify@kernel.org>
 <20260115220918-GYA35965@gentoo.org>
Subject: Re: [PATCH] MAINTAINERS: update email address for Yixun Lan
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 15, 2026, at 23:09, Yixun Lan wrote:
> On 17:02 Thu 15 Jan     , patchwork-bot+linux-soc@kernel.org wrote:
>> Hello:
>> 
>> This patch was applied to soc/soc.git (arm/fixes)
>> by Arnd Bergmann <arnd@arndb.de>:
>> 
>> On Thu, 15 Jan 2026 10:03:35 +0800 you wrote:
>> > Switch my email address to kernel.org account for more convenience.
>> > Also add entries to the mailmap.
>> > 
>> > Signed-off-by: Yixun Lan <dlan@kernel.org>
>> > ---
>> > I will send it along with PR to SoC maintainer via SpacemiT's SoC tree
>> > 
>> > [...]
>> 
>> Here is the summary with links:
>>   - MAINTAINERS: update email address for Yixun Lan
>>     https://git.kernel.org/soc/soc/c/8bb9fd440aec
>> 
>> You are awesome, thank you!
> thanks you!
>
> I just applied the patch at SpacemiT SoC tree - but haven't sent out
> the message, since you've already queued it, then I will drop it from
> my side to avoid the conflict.

Ok. I missed your message under the '---' line here where you said
that you were going to apply it.

For future reference:

- I tend to take MAINTAINERS updates into the fixes branch to
  fast-track them and make sure the current release has accurate
  entries

- If you are posting a patch for feedback rather than inclusion,
  don't Cc:soc@lists.linux.dev (formerly soc@kernel.org) as it
  ends up in the https://patchwork.kernel.org/project/linux-soc/list/
  instance that should only have content waiting to be applied.

     Arnd
