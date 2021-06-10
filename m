Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EAAC47094
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 15:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C04C613DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 15:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C04C613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E52AwvhkoZ9TATPbR7Ek1OxF2aTSBNPRWtB7GXsOO14=; b=k4JpdSLqea7Q6FIRXDWnNPBhOI
	AHGW4e5zJM0kFzujLgp+mMP6YM8tNIw6PxQ3f9CgfItfWaY7ttbGwMIul58VL6ZFDyUG3g9zN60CO
	YK5VPg0kq9vbPBCd2Ypg31KFdoRmvKwjQdxQdaEpVGnnfbFvUeEohHktGsOqsXvbuWCvu6cVmx9zo
	4aJIPUsK5BNRTl/o7OmVQofRdFMAlx3aloWTsKI0cDM8MjLclJyeSEzUu6RAuhpbAD5y8PCMQD4Y/
	MJCVXRnhKxKcTyFqqWo0EU/F22NyGtPhcq/OVhWywO1TcJezzuKfTHrzUvlh2iuHAY8sGZEWcN84M
	zHBENDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrMEn-001Hru-0z; Thu, 10 Jun 2021 15:04:53 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrMEg-001Hp7-JT
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 15:04:50 +0000
Received: by mail-wr1-f49.google.com with SMTP id m18so2716350wrv.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=maDX1SqEQGmbJlvnWGoFUMoFJ5cg99gOE1aPzue8sQc=;
 b=CM3OxKfIneIAUiLf5Zk7CX1dZ+8sSdQ76IbHP2tuZgRjPcYy/z1Yv6PUlaqE9NYSBo
 QWw2VAs6hA/Rt5fp6On+lvmLyJXpiGVnNihRdFlPAjoGXJ361gMv8lMt4qkdtZAHUnlK
 +WB8MpPrfSQJoARGfQzv3XE4xtLN2foAvm4fcVvJdrgxn1B++udXsElXnAMJpTewDg2w
 ubV1bzDUShW6GGqKdbh+b5iiVANMa9DBWeBV3ce6k1PXFUK3ich76bw4yYXaTlTf/yY/
 idZsW7AX4esUjWByduaTJLezo70qlY0CUWWXtc/drySh17MBJAT8e/vM4/bav/3ulLIi
 09DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=maDX1SqEQGmbJlvnWGoFUMoFJ5cg99gOE1aPzue8sQc=;
 b=CNDOy8R3Etkm8u5XRSiKhWsSHJqOEXPzhFSDVhpghjxaOZdMYyBxmNFxlDnVP7hp3z
 lsmxVhXoc9zquFCg84K0VZPDgDmv36xzxwuCjHpLY3YIqxDrrxaRdFZ1XTFg0EK825dF
 eyE2MQo5I1lyycs8WYEfG6+P4/fUMwv7yjlltIKJ77PDidAQVkH+aNvr5Jl4P8yOOsFT
 CVojH9obxQ4hyi6bHy/oh9bPdb6oCd5Z6P71XAPSgy+vOgkyfYOQcqBZ/bZkzO4JJ571
 AeoMSIxTN8jwJZqcu/Cn1+Aa/cJ2Yi9UVdXU/xNRjNxC5b9Tspq2vBtAeXOZjaWwsv8N
 lunw==
X-Gm-Message-State: AOAM533s0FusabpPFlNa/q0rEJZaUSJYxj50ApesXJ0onzwekRIsQ59v
 Kij9dIxC1Q9Ln6gNgrXbwRs=
X-Google-Smtp-Source: ABdhPJwI0pDe52r2vhAsfmYMLDJnqn5RBM1d0jDdXYIV9WJl4CSRRI62IkWpVAjPBPaE3eD5NbX/ng==
X-Received: by 2002:adf:f7d1:: with SMTP id a17mr6103816wrq.84.1623337424570; 
 Thu, 10 Jun 2021 08:03:44 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id m132sm3222349wmf.10.2021.06.10.08.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:03:43 -0700 (PDT)
Date: Thu, 10 Jun 2021 17:05:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
Message-ID: <YMIqNynz29Z9fYi3@orome.fritz.box>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck>
 <YL+A+MPjjaa3nSwq@orome.fritz.box>
 <20210608164851.GB10994@willie-the-truck>
 <YMHZCaRiQNQCSsVr@orome.fritz.box>
 <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
MIME-Version: 1.0
In-Reply-To: <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_080446_695913_A428C455 
X-CRM114-Status: GOOD (  39.66  )
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, soc@kernel.org,
 arm@kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
 Olof Johansson <olof@lixom.net>, Dmitry Osipenko <digetx@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3477768206376093663=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210610150527.1EuUlOntN8owYiVVRHOA8Y2Qf1-gkljVbWbjYF3G-_0@z>


--===============3477768206376093663==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7mpR+8HugVK1gP7Y"
Content-Disposition: inline


--7mpR+8HugVK1gP7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 04:23:56PM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2021 11:19, Thierry Reding wrote:
> > On Tue, Jun 08, 2021 at 05:48:51PM +0100, Will Deacon wrote:
> >> On Tue, Jun 08, 2021 at 04:38:48PM +0200, Thierry Reding wrote:
> >>> On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
> >>>> On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> >>>>> This is the pull for you to base further SMMU aptches (prevent earl=
y SMMU
> >>>>> faults).
> >>>>
> >>>> This is a tonne of code for me to pull into the SMMU tree given that=
 I only
> >>>> want one patch!
> >>>>
> >>>> Thierry, if I just stick:
> >>>>
> >>>> https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gm=
ail.com
> >>>>
> >>>> on its own branch, can you stitch together whatever you need?
> >>>
> >>> I'm not sure I understand what you're proposing. For reference, here's
> >>> the set of patches that I sent out:
> >>>
> >>>   1. memory: tegra: Implement SID override programming
> >>>   2. dt-bindings: arm-smmu: Add Tegra186 compatible string
> >>>   3. iommu/arm-smmu: Implement ->probe_finalize()
> >>>   4. iommu/arm-smmu: tegra: Detect number of instances at runtime
> >>>   5. iommu/arm-smmu: tegra: Implement SID override programming
> >>>   6. iommu/arm-smmu: Use Tegra implementation on Tegra186
> >>>   7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
> >>>   8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
> >>>   9. arm64: tegra: Enable SMMU support on Tegra194
> >>>
> >>> Krzysztof already picked up patch 1 and I was assuming that you'd pick
> >>> up 2-6 because they are to the ARM SMMU driver. However, if you're
> >>> primarily interested in just patch 3, which is more "core" ARM SMMU t=
han
> >>> the rest, which are Tegra-specific, then I suppose what we could do is
> >>> for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof o=
r I
> >>> can pick them up and take them via ARM SoC, based on the stable branch
> >>> from your tree that only has patch 3.
> >>
> >> I think you previously said that patch 5 depends on patch 1, so I can't
> >> take 2-6 without also pulling in the memory controller queue.
> >>
> >>> Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
> >>> touches only the Tegra-specific matching bit in arm_smmu_impl_init(),=
 so
> >>> the likelihood of that conflicting with anything else is fairly small.
> >>>
> >>> Is that what you were proposing?
> >>
> >> I can queue as much or as little of 2-6 as you like, but I would like =
to
> >> avoid pulling in the memory controller queue into the arm smmu tree. B=
ut
> >> yes, whichever of those I take, I can put them on a separate branch so
> >> that you're not blocked for the later patches.
> >>
> >> You have a better handle on the dependencies, so please tell me what w=
orks
> >> for you. I just want to make sure that at least patch 3 lands in my tr=
ee,
> >> so we don't get late conflicts with other driver changes.
> >=20
> > Yes, if you could pick up patch 3 and send out a link with the stable
> > branch, I think Krzysztof or I could pull in that branch and pick up the
> > remaining patches. It'd be good if you could also ack the remaining SMMU
> > patches so that ARM SoC knows that they've been sanctioned.
> >=20
> > Krzysztof: would you be okay with picking up patches 2 and 4-6 on top of
> > your memory branch for v5.14?
>=20
> You mean the iommu patches? Yes, I can take them and later explain to
> Arnd/Olof why they come through me.

Okay, great.

Will, can you provide that stable branch? Or would you prefer if I
prepared it and sent you a pull request? We're kind of running out of
time, since for ARM SoC the cut-off point for new material is usually
-rc6 and that's coming up pretty fast.

Thierry

--7mpR+8HugVK1gP7Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDCKjQACgkQ3SOs138+
s6G9mxAAvng5nEyjLg9tvjEBYmqVzd3B9QUm5jd6sZZq6YdD6wjrUpmwWSTcP7XI
dJ9T722dGWz3HENw9AIgv4zMj2/ws8g84+1dvjL/eo56PaWLoNdCpm2IokdKjl2G
3sjYPEBPyEr+nqvsu+wIMbYeiXGfK2nndGg+Mw5wBnt/dQ5fYPLtKc/o5XSo5M5R
7qmp3ekHSU5fD/X8F5+bCZajyaVyLFNU58FdsCf0yRTcqED5uWPO0TPp/VwPnlIw
Q19s+JQD+V4XbFMgSadlPF8VP/Dht7W8tiUBl5WpoPMqFpBa8AtkZ6VrAjaM92tf
fTyVdA/fZg04rh3M1yH8QpOOYA2z3YmGj3U2ShYAAQSnoiqLwW2fE+pEqQfmRDPI
2rJdP8aTuXzxdMVFpklP7iTPjOd2aNSZc3gQ9U9xNF9tDd74DDYVJqCt3D3C0bhP
Mk8hioQpf3HtY53fnBcF8g3zGgYrd2ZEQuAp5McB/mbhpmj+kiJs/iUZVVoYfu4H
GWAERzA11dmouEHyWWjtmVGPujs/Jxt6eSJiNvn4WvuS6ezYP55NQ0Z7U+17/QqI
1Xo+q01r+6JON6Rx730qOjuWJqqx8Oo1db+BBN/Tp/g1xlC0YmobTwchCC0RSgho
YOaTy2yuc++OIrpXDJT80MHodI4MBVDJHKqqsOpeH1szjvdGpqc=
=iL3y
-----END PGP SIGNATURE-----

--7mpR+8HugVK1gP7Y--


--===============3477768206376093663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3477768206376093663==--

