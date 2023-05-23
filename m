Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0AAC7EE23
	for <soc@archiver.kernel.org>; Tue, 23 May 2023 05:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99AD5C4339B; Tue, 23 May 2023 05:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C835FC433D2;
	Tue, 23 May 2023 05:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684819202;
	bh=VCOHu+r91RekSvZ+lEnUHnm2c/u+To8APapSLwT3z0M=;
	h=Date:From:To:List-Id:CC:Subject:In-Reply-To:References:From;
	b=VibwJcx2lwId8O7YxhtlikOxayiGhjyjJTUq7YuV4ydjTCh3JlTDLA2SjBieq4t/6
	 IeL0E8NeFfZpixEAOnbldfdOK7LSZuEFayJlKTBDXcFBR3ZEZwfWLl4cIFVHnbMQZl
	 zJAGkZirV9K65cN1FBwQw2VIRaaLQDmiNpzAG+EYoDMJj4aq3DjjRwC0Y90epyApuP
	 bg9ks0fYg3N9Vfb/z1Wq5I5aOmf+Ld1QUqbBDfwQgfDm6BmyNhoUToHxATNqPmche4
	 BsBOi+hAOsUvsJldEfAFdDTGtn2zrSSbpYkA/284U8yUwKLgAO6vd1Ok5SaxD0g+7u
	 eFt3YwD5dVEKw==
Date: Tue, 23 May 2023 06:19:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
List-Id: <soc.lore.kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Olof Johansson <olof@lixom.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
User-Agent: K-9 Mail for Android
In-Reply-To: <3B8DFBEF-9EA1-4375-998D-944EA18D3E4E@jrtc27.com>
References: <20230515-geometry-olympics-b0556ff8a5f7@spud> <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org> <20230522-concrete-unpeeled-7e4718e61b46@spud> <3B8DFBEF-9EA1-4375-998D-944EA18D3E4E@jrtc27.com>
Message-ID: <C9862C5C-083E-43B1-8556-4FE1A61F81B3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 23 May 2023 01:32:49 IST, Jessica Clarke <jrtc27@jrtc27=2Ecom> wrote:
>On 22 May 2023, at 22:34, Conor Dooley <conor@kernel=2Eorg> wrote:
>>=20
>> On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
>>> On 15/05/2023 21:20, Conor Dooley wrote:
>>=20
>>>> +devicetree ABI stability
>>>> +~~~~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +Perhaps one of the most important things to highlight is that dt-bin=
dings
>>>> +document the ABI between the devicetree and the kernel=2E  Once dt-b=
indings have
>>>> +been merged (and appear in a release of the kernel) they are set in =
stone, and
>>>> +any changes made must be compatible with existing devicetrees=2E  Th=
is means that,
>>>> +when changing properties, a "new" kernel must still be able to handl=
e an old
>>>> +devicetree=2E  For many systems the devicetree is provided by firmwa=
re, and
>>>> +upgrading to a newer kernel cannot cause regressions=2E  Ideally, th=
e inverse is
>>>> +also true, and a new devicetree will also be compatible with an old =
kernel,
>>>> +although this is often not possible=2E
>>>=20
>>> I would prefer to skip it and instead: enhance
>>> Documentation/devicetree/bindings/ABI=2Erst and then reference it here=
=2E
>>>=20
>>>> +
>>>> +If changes are being made to a devicetree that are incompatible with=
 old
>>>> +kernels, the devicetree patch should not be applied until the driver=
 is, or an
>>>> +appropriate time later=2E  Most importantly, any incompatible change=
s should be
>>>> +clearly pointed out in the patch description and pull request, along=
 with the
>>>> +expected impact on existing users=2E
>>=20
>> I'm not really sure that I like this truncated section so much, but her=
e
>> it is=2E=2E=2E I kept the last paragraph intact as it does not talk abo=
ut the
>> ABI, but rather exceptions of submaintainers=2E
>>=20
>> devicetree ABI stability
>> ~~~~~~~~~~~~~~~~~~~~~~~~
>>=20
>> Perhaps one of the most important things to highlight is that dt-bindin=
gs
>> document the ABI between the devicetree and the kernel=2E Please see
>> :ref:`devicetree-abi` for devicetree ABI rules=2E
>>=20
>> If changes are being made to a devicetree that are incompatible with ol=
d
>> kernels, the devicetree patch should not be applied until the driver is=
, or an
>> appropriate time later=2E  Most importantly, any incompatible changes s=
hould be
>> clearly pointed out in the patch description and pull request, along wi=
th the
>> expected impact on existing users=2E
>
>Do you have an opinion on acknowledging the existence of other OSes here?

I think that is fair=2E
