Return-Path: <SRS0=OvlU=JK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2D9C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Apr 2021 09:57:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B88261370
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Apr 2021 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B88261370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0SRa1zdFLUyZq5GpFZmLlsRD8+AFMBGcUhAU7GnlinE=; b=SocdQ7FXVLDKDrpQcAxETZhNS
	vDHaMzKKYZjI47TkfOLJ8DJytZgdSTm8BVkAbt1V8qhRzNZDtVuwGttBw7dBbkLOdzH5e7oANnPkU
	vG38mUhnLFgEY48dzaweQz7ofLyLeo+/NsKm5GYEiRLQdnGdIVzgyOrEZMNl0y4atKwjR+G3gTV5I
	7AyooU8h8ccGkrjuRwNaUu7KwGqLYwoNeEKw1N0mel/ksTcgaB8yBblWGbZgedVtrMNpbRvzBWgmv
	EOZPSKwt2j51Im8Jw9i8bRtyuHhLeanXEaDVoo1+C3fW5XqnHT7KNrDgX/sxq6Y4ZlRWkQDvpJZFt
	8flujVDOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFlu-008o6x-6m; Tue, 13 Apr 2021 09:55:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFlq-008o6I-9O
 for linux-arm-kernel@desiato.infradead.org; Tue, 13 Apr 2021 09:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3yr28My6WXoo6CQW/YIHzqImC+8GIX9W8yNiJe7vnrE=; b=qcLlQUlVDHmtDYpEdhMuU6nhAj
 HgZCTexQfUGuIZIoXkHsmSjwUOVLw84qQL+Ck9IqY2A15dNRpr0BVXKahz5QYBm1DYk/aAfWCwfX3
 gQj8P5MBSem+YTNDN1+KyJbh4VAk85eOJaPDNlN6M3ampliaF58rSfh76h40F9hsGeR9ymPrMIR41
 lG9PQtV7mThLzc9PcPYhTHXbdc+Ro/R3ZXyVUQjUgDXaxA2pBKhmxZtRbg07W/AZ/nBsnetJOOeks
 E0d24GUHtOiwkHOlKwwhV2G51vUAMCYjW6W+R9uLhwm2SGS3rzG4lipowo+NZBQ1iDIYEIo47sk3X
 jXWLa5gA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFln-006uFU-TL
 for linux-arm-kernel@lists.infradead.org; Tue, 13 Apr 2021 09:55:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E444661369;
 Tue, 13 Apr 2021 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618307743;
 bh=3yr28My6WXoo6CQW/YIHzqImC+8GIX9W8yNiJe7vnrE=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=HlHQfDs8VuzU1M9tViQ8vhwG4fJYOLYYMhQuLA4elC4cXfvVf8YNZ38//74DZHR9P
 FqdtpoYxPho3wWAFYdUewtEm7J9ksZTKNqzvc/ZwCLSoOhzUT0AV19jkz9jqklAc4B
 DmAq8AH9Sf9SXzVNsNqLrlrxqmGW7OWSOvBmfs19xX/FB5XMIKcGdtPjWuhx4cWegp
 iILFfmzA9D7gFFeQx+1Hv3rTljR6mA6cMkLXolBkFZWMVHW9YC1J/gJrFPYsmup7ch
 7uKy/7VluM1DxHm7aFroALTah6Y1ImpuqIOx5uHqtezlV5hCGVDqq+lzhUPjdV3Kok
 td9ZQbyPPOdng==
Date: Tue, 13 Apr 2021 10:55:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
Message-ID: <20210413095522.GA5586@sirena.org.uk>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
 <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
 <20210412160116.GA904837@yoga>
 <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
X-Cookie: Shake well before using.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_025543_990513_6151EAF2 
X-CRM114-Status: GOOD (  17.29  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2384915597988420807=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210413095522.zfBatjKKZI6XOJgMtAFniw7ncnnwjF_LDQmDqRnFHpM@z>


--===============2384915597988420807==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 12, 2021 at 08:52:37PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 12, 2021 at 6:01 PM Bjorn Andersson
> > On Mon 12 Apr 08:14 CDT 2021, Arnd Bergmann wrote:

> > So the same binding patch is picked up both in the driver and soc tree?
> > I was expecting that to cause (harmless) conflicts when things arrive in
> > Linus' merge queue?

> > Or are you saying people go the length to create immutable branches for
> > each binding?

> I think it's usually one immutable branch for all the bindings of a given
> merge window. This avoids the merge conflicts, and you can add further
> bindings on the same branch before sending it off to the soc tree.

Even with a single branch for everything having to split serieses into
multiple branches seems like a pain, it'll break my automation for
example.

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB1aokACgkQJNaLcl1U
h9BYoAf/d8xl+p11Ol3VZqWHP5xhJep7Q+NToFMOwICDFa+dQGCm8AKljcF3Vhr1
gn9IA7MeOUIMv+mEVKnHr0p+UP3GG84Dn+uTn0E4DYZkipBpvb4pBz3pvl/kFr5Q
/o76CegXEwkycuW8AosKMCGhnrgPMsInV/Mu3sGv7DTI0IaLjDNH7TS14Az9genT
SSTsu/0L4TnLZIlRLRI1hZ/4KPLzjIR+rSfR/E7j71VOQNF5GnIAKj0xOQcGJv4H
vtW2j2WTKCkedDbDBvHxMsd7taiVnAYYFzbKU5gd66caudzHqJdJGh45irJLoJDM
EO3U4LepMpL/s/OTT263JrPdl9K1sw==
=kGwu
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--


--===============2384915597988420807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2384915597988420807==--

