Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615F14F70
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854483; cv=none; b=ilyEHM1lHz2a3Y250TlrUEP3jpNmxdj/OmN+XtqeaeoywP450rmSGAYgeDs40dGfgN/XD7kZtmkp/GuGe/TiVlszb57VlDty33vD7SDfAuGzgmxST354UykW3xRq1PTTRL31w5IhJBG64+OhdmfyvXPTAihXdwIp3ftGNBfGX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854483; c=relaxed/simple;
	bh=dpcTKw8HGt4a+5qT/hDFPQtUrxlgUMTf/iolgzgi8KI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h0ibsvSCD3dNbI4B7zyA2PBuTk5zzUL5pZROkyIfe71CQjLr+EuYIE/f7vxv4Q5Hav6HQwkogeZl08hkAtFBUg3XmdLTvS87YPKnjqmIl8NWWLRPZc9DHkfM1gCAslUYX1E0fk6+hDau/UgETuXSjNVx9xDF8/ylJVoeH7IHWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DvlwfmIH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XXvQQRze; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DvlwfmIH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XXvQQRze"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4212D14001C6;
	Wed, 18 Mar 2026 13:21:21 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 13:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854481;
	 x=1773940881; bh=jagtLdQJsGMP0CDRK1vPex3dVzuRTMvC17L8mq7uFuw=; b=
	DvlwfmIHU8BAYASjuJxNmADSNiUiHUyphkCmYoVaro2VQTbPhnvIKSQL1FDtsUQr
	Hiv3L6/2Dv2C7z1i4CV6lrzt23wK4t9OLfAh1C4kLlUSALzDMy9BDrgrcbknZ9lW
	d7jzVCMEH3jjE9GymvYkpVzzgxiIZ31XpzJK1qrTfKRzpUw+9ggVTJrTTCyjDWBW
	zls7N5Fz1q0Gf4kc+2WnbM8/61I5YuuHx+I1xXwHENu2sI85wO24oRKXQanZMNdZ
	3dJkbx92fsr2EGV/S2aACHW7KhJWFvIeDRWe+BHsnUv4fUZRvV9qv1EBZECZgwWb
	6xZ1wM2X58Gdw3F9Knf2tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854481; x=
	1773940881; bh=jagtLdQJsGMP0CDRK1vPex3dVzuRTMvC17L8mq7uFuw=; b=X
	XvQQRzeGfDyEY6AvHla+xu9C0ywBxK5uRBc/Eiutx9qPw/Udn5wnSAt/28T0jCmf
	84DX3mMGgqDSMT48Enj0UgiLt0xFuMNYmRjFufO05yt6PZC5ip8RbvPDPP2DUFY8
	XFe+az1AKqlKIuxfoQi+xDh/ZAtR9gukqtC0rYniwTfALiyf4Mp/prR3sJfxvAm0
	2SZi6RCoOgwqFUnDQwUVm9LaUo663R+6S6s+YGYTq4F84sCHOXWMS72+PRdG51PL
	WN2N4LyUvKa7L73WARo4QMScxLj2nX5sYgrOO4VaDYcpv9JA3n3FRQuTlHOVuS+J
	QQ5+J9ULFycpSMzs0o2yg==
X-ME-Sender: <xms:EN-6aTI9urYfe9ltkF3bDQh1b02bv7xcqGuIfvEZrQDGWow0gG7yHw>
    <xme:EN-6aR_O7cEYDNRnW5232w8KuI8BlEBQUgvUciWmj5V8_ZdN9Ej41Y2-4uXlxlfZH
    uzATaB9ofnXcOgEXKYySs1_F36GFCLZpzcshx62p3iB-Kerfu4doYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrd
    gtohhmpdhrtghpthhtohepfhhushhtihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvrghlth
    gvkhdqshhotgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehs
    ohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheptgihrdhhuhgrnhhgse
    hrvggrlhhtvghkrdgtohhmpdhrtghpthhtohepvghlvggrnhhorhdrlhhinhesrhgvrghl
    thgvkhdrtghomh
X-ME-Proxy: <xmx:EN-6aWGci87qidtV5ePK4Mj0DKd41rEqP33OOMSPpzv-BIdUFSeiEA>
    <xmx:Ed-6acgC3dfIvOMaQ2KS947W14bm0zEsnUxLEtWpHn1BwoepFDI2vw>
    <xmx:Ed-6aThnZJkekd7IFekSNTqQIoqUWFhFUjbfWFlz316F2nmmlSVaEQ>
    <xmx:Ed-6afmBOtouBPwzXzJDlLB8oBHmDB3yVMukb1N4PyckPHKP6v1BGw>
    <xmx:Ed-6actyG8IEUnS-S4CiKiZoddQyKVQM6lMhIgSkIIYv_FvG8ajKNFjM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D3CC5700065; Wed, 18 Mar 2026 13:21:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Aj4MA5-83_jg
Date: Wed, 18 Mar 2026 18:20:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>,
 =?UTF-8?Q?Yu-Chun_Lin_=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?= <eleanor.lin@realtek.com>,
 linux-realtek-soc@lists.infradead.org
Cc: "Drew Fustini" <fustini@kernel.org>,
 =?UTF-8?Q?CY=5FHuang=5B=E9=BB=83=E9=89=A6=E6=99=8F=5D?= <cy.huang@realtek.com>,
 "Stanley Chang" <stanley_chang@realtek.com>,
 =?UTF-8?Q?James_Tai_=5B=E6=88=B4=E5=BF=97=E5=B3=B0=5D?= <james.tai@realtek.com>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 "Krzysztof Kozlowski" <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>
Message-Id: <3316207d-c7f7-453c-a0ec-e9dffc26a469@app.fastmail.com>
In-Reply-To: <bbabf0f1-99fa-4822-85c8-df76ce89da01@suse.com>
References: <20260318114047.2804171-1-eleanor.lin@realtek.com>
 <405a9783-0f77-4ce0-8288-43eaada09cff@kernel.org>
 <e4c0187e-566b-42fb-920c-3cf73ed6cd6a@app.fastmail.com>
 <bbabf0f1-99fa-4822-85c8-df76ce89da01@suse.com>
Subject: Re: [PATCH] arm64: dts: realtek: Fix memory node unit-address mismatch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026, at 16:27, Andreas F=C3=A4rber wrote:
> On 18.03.26 15:28, Arnd Bergmann wrote:
>>>
>>> I drop this from soc patchwork and please do not send code for review
>>> there, but either fix the lack of involvement from Realtek or let's =
drop
>>> the platform if Realtek does not care.
>>=20
>> As Andreas has not replied to the MAINTAINERS updated, I would
>> prefer to merge both that and this patch in the bugfix branch
>> for 7.0.
>
> Sorry for that, still lacking time, but at least receiving now...
>
> I'm happy in general for someone with more time taking over.
>
> Last week I spoke with Realtek (at EW) about testing the newer SoCs.
> As a reminder, the mainline removal of TEXT_OFFSET broke my ability to=20
> test the older SoCs that I had access to. I hear that Kent and other=20
> recent SoCs do not have the same bootloader limitations anymore.
>
> We would need to consider moving me from M to R and possibly changing =
my=20
> email from .de to .com due to recurring quota overflows.

Ok, sounds good. Yu-Chun, can you send an updated patch for the maintain=
ers file doing this?

> I.e., new maintainers would need to queue patches and send pull reques=
ts=20
> to soc then. Are they set up with GPG keys / kernel.org tree to actual=
ly=20
> take over on their own?

As I understand, the MAINTAINERS entry is one of the prerequisites
for getting a kernel.org account, so I would start with that.
I don't know whether they have signatures from anyone on the keyring
yet, but I'm sure that can be arranged.

> As for review, there was one other review discussion about ISO/Misc=20
> areas that I found concerning: Those areas have been clearly documente=
d=20
> and (on the older SoCs I know) contained registers wildly lumped=20
> together (from kernel PoV), so that having them in DT and accessing vi=
a=20
> regmap seemed the best way to me, compared to trying to map individual=20
> words to specific drivers. My old branches may contain some example=20
> usage in queued but non-merged drivers. (Amlogic may also have similar=20
> concepts of always-on vs. PD-controlled peripherals grouped in DT?)

Right, that makes sense, and this is consistent with how we use syscon o=
n many platforms.

> Another open thing would be help with mailing list moderation, if we=20
> want to continue using it. Any review responses by non-subscribers add=20
> to its moderation queue (plus any spam).

Maybe just drop Moderation altogether then?

   Arnd
