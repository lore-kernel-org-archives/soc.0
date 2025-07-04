Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D495C221739
	for <soc@lists.linux.dev>; Fri,  4 Jul 2025 06:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609663; cv=none; b=bYuZWKeXG64ut7qVxiUhIQZnH6CHzoZ+aZyxtweNdlXwwzs4IMYrNy6JoFa7lOGC7MZA5ModRXHFasCf+t8QOjsecw2+Sdf21xgtjuYCVT/PMF6r4bzHQhh00asEfk/mXXji45CErJUngPhRB+2IcYcG2jrokqp9sj5oxnryjJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609663; c=relaxed/simple;
	bh=b7KThyfeNmUSWa4tqY0wM2x6LwBm/68E9EK8yCkG8oY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bCOjm/O9Mx06LpMifjzOI6ne6BCcX7bPLIae9bnejgI6IJYWH6nM1e414oU0Hugzeh7NPpztoOc6uQCXjUibipr/GYaxHwmrYQ7bybDcMOrVAW71bhc+1JYOPvuOI/khrqnW3FFvmboDwQA6UFyP4sJp+sR9YSqBXkoimi8SCxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=I/L/BLQx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="I/L/BLQx"
Received: by smtp.kernel.org (Postfix)
	id 8EB68C4CEEF; Fri,  4 Jul 2025 06:14:23 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E0D3C4CEEB;
	Fri,  4 Jul 2025 06:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E0D3C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751609657;
	bh=7bXrPY3H94g7YXg0H9ndWtt+CBCWKcz0VdnTPz/W2PY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I/L/BLQx8EPDv/dljMtyfKF3uXgaD99LfGihR1GlpNNuOreHi7DEHI6QsWkUaUjr2
	 UckOObdSfN8sFHkvFJvnBwmIUwYz9nfveAEsPLMy/3vgzbPSuzkrR12GgFmcIDmLyF
	 UM79N7mUQGQ7ancmkQgpcBQSPXxF1cPK3LlLkRjGF3X5AMw8M+CS++pA8VinB3fHT4
	 4B7rht7pjXNK9s9ifHWeR4ke2uBCPKpf9sJd2/eno8peKBrR+QsyEYI9ttGK0yBaII
	 qTk0a5Q9ZSwhaTMxz77Mnqn5hfoS5EcUbG/3b2KGlX12fx9y0XQQQlp/8Jyhi9JtYE
	 2j54MlIrZFHGg==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1C83C640A2;
	Fri,  4 Jul 2025 14:14:15 +0800 (AWST)
Message-ID: <ef04b779397a28f8b3a4ff3148848d1e5f08f32a.camel@codeconstruct.com.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.16
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
Cc: arm <arm@kernel.org>, soc <soc@kernel.org>
Date: Fri, 04 Jul 2025 15:44:14 +0930
In-Reply-To: <f650e0dc-43aa-41ba-9ae2-8edd0ed70f64@app.fastmail.com>
References: 
	<CACPK8XdYLf6s=GtB5bsEw4zj0JjUBob-6GhdJzivX51y+E=KEA@mail.gmail.com>
	 <2b301def81460b686ecb9e0fa05f42e8122419b6.camel@codeconstruct.com.au>
	 <f650e0dc-43aa-41ba-9ae2-8edd0ed70f64@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Arnd,

On Thu, 2025-07-03 at 16:49 +0200, Arnd Bergmann wrote:
> On Fri, Jun 27, 2025, at 06:41, Andrew Jeffery wrote:
> > On Mon, 2025-05-19 at 11:42 +0930, Joel Stanley wrote:
> > >=20
> > > Here's the Aspeed pull request for 6.16. Andrew has prepared the
> > > patches and created the tag, so all credit goes to him.
> > >=20
> > > There's a change that Andrew calls out in the tag I didn't really
> > > like: it breaks old userspace by moving things around. The argument i=
s
> > > that userspace was "wrong" to be using the paths under /sys. I think
> > > the cart is leading the horse if we let the yaml checking take a
> > > higher priority than breaking userspace. But I haven't the time to
> > > fight that battle, so here we are.
>=20
> I would agree that compatibility with applications is more
> important here. There is a very limited set of users (in terms
> of what type of userland they run), so you can claim that this
> is under control wiht newer openbmc versions, but it does
> give a bad feeling.
>=20
> I also think that the new node is not quite right either:
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 apb {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 apb@1e6e0000 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatib=
le =3D "simple-bus";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x1e6=
e0000 0x00010000>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address=
-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-ce=
lls =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;
>=20
> A "simple-bus" should not have a "reg" property but should
> list the registers in the "ranges" (with the children
> being adapted accordingly). Can you try that instead?

Oh, definitely. Thanks for the feedback there, unfortunately no-one
responded on the list at the time to point out that mistake.

>=20
> > I'm looking to get ahead of things for the next merge window. The
> > ASPEED PR didn't end up getting pulled for v6.16 - possibly it was a
> > combination of a few things: I expect it came a bit late in the cycle,
> > Joel expressed some concerns about the changes to the APB DTS nodes,
> > and well after the fact I noticed it was sent to arm@ rather than soc@
> > (though Joel suggested these were aliases, at least in the past).
>=20
> The main thing is that I did not see the pull request at all, for
> some reason it did not show up in patchwork at
>=20
> https://patchwork.kernel.org/project/linux-soc/list/?series=3D&submitter=
=3D&state=3D*&q=3Daspeed&archive=3D&delegate=3D

Ah, I've added a note to check patchwork after we send a PR. Thanks.

>=20
> I think the old arm@kernel.org=C2=A0address still works in theory, but
> that may have caused it if the forward did not happen for some
> reason.
>=20
> Note that the correct address is now soc@lists.linux.dev, so
> please start using that in case the other ones stop working
> in the future.

Ack. So I was wondering why I'd been sending to soc@kernel.org. Looking
at MAINTAINERS, Konstantin updated the entry for 6.12. I think I may
have been using the old address because soc@kernel.org is still
mentioned in Documentation/process/maintainer-soc.rst (as of linux-
next/master @ 8d6c5833).

I've made a note to use the soc@lists.linux.dev address in the future.

>=20
> > Were any of these factors? I'm hoping we can avoid the same
> > pitfalls this time around.
>=20
> Feel free to ping me on IRC, sometimes that is easier than email
> because I do miss stuff in my inbox.
>=20

Will do.

>  If you see a pull request
> in patchwork, that means I will get to it eventually though.
>=20
> For this release, can you send the remaining contents (anything but
> the APB node changes) first, as that should be uncontroversial.
> Please send the patch separately, so we can hopefully get the
> DT maintainers to review it first. I would like to see an Ack
> from Krzysztof or Rob on this.

I've dropped the APB patch from the aspeed/dt branch, so the 6.17 PR
won't contain it. I will rework it for next cycle and try to get the
attention of Krzysztof and Rob again.

My goal is to make it as easy as we can for people to check their
devicetrees against the bindings, and having to wade through massive
amounts of fairly spurious output doesn't help anyone (on top of the
remaining warnings that the ASPEED devicetrees unfortunately produce).

>=20
> We should also talk about the ast2700 merge, I assume we will
> do this in a separate branch that contains all the patches
> for ast2700 rather than splitting that up by dt/config/code/...
> branches.
>=20

Yep, makes sense.

>  I expect to merge a couple of new SoC platforms this
> time, and would plan to have these in one "New SoC" branch
> that I send to Linus. In future releases I would want them
> split up again.

I don't expect to be merging any of the AST2700 bits for 6.17, the
feedback on the existing series suggests a few more iterations might be
required before its ready.

Regardless, when we do get around to applying that work, I'll get in
touch and we can coordinate it as you prefer.

Thanks for the response!

Andrew
