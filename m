Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5935E93E
	for <soc@lists.linux.dev>; Thu, 20 Aug 2026 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269279; cv=none; b=PzBE7SbjsQNKvEWE8Fi7E+SdOTS+NgnW+PLCGCq8inRb/SQbhUyo0J3OootNTuwuTjsRyS+blKcM1blmjish2KpUzzFdK4JTsmA5yk0f62Bw2fdpnDP0uk0/sM4otNytEwM0028k/NOVAvx7i3wjvAfQ+2kR9XkudLeXDs4pPNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269279; c=relaxed/simple;
	bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/W+1uF0UANsPOpHByamMH6he54rX5cGMIPLGVgkXKur9uUZKDWMiRvrFvXvWkHHBkADE+B0k0bxaASpZbxOy+3LuVbvYbCEwM3ET1BQmhyyuwB4Sa/Jxr4jZe7che7zjAmhZZcKTp+aUdAi9HHRVlRjiZTY9CJq//FWrmy5N4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S8esU2JM; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S8esU2JM"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so250011241.1
        for <soc@lists.linux.dev>; Thu, 20 Aug 2026 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787269277; x=1787874077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
        b=S8esU2JM9BX0Wbz9kETwiD3z5QhKwJR3dlgfC8DJHUzeuooo5yoFEjDzTfKrFU5vNL
         +1kk52wnw4+Jqv3Swg+53+PdKnbw4S6Kks4WhupfeD6YJnHwrASU3KhvyE2YXSVxuvBc
         grZtPISBvKETKqw9MaZxiHc7jE5ot++X6RM/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269277; x=1787874077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
        b=jtP1Oo9lyVwjsZxdqjgxY79Qkk62+spTYAUFFBrdB1cO/QTemVukh1s5whSQIZRder
         AmSupVN9ZFNSlYp5GGa+PZz9RwgpM1MUw//U/NZh03Lkzms9PCJoYw0ajpy5cAaaTIj3
         TJ0Ge+CMEr/nRacfXnwqY+e29q5mWGhB8sjq03lEv8YK9miYII46l9bwWmGp+APofjAG
         HxgTbTaKt/NTX9mB69riCBjEroI709QoOPHL+2ZV3T9j/RdnsF79+YbnDkgxAalvH8eT
         2t2BtrrKu6Xzxqnx9GWYVM+dukP3eEjs0aMRD6vOsqWxW6II7lCCooXEg2YwJn62FwMu
         BZZg==
X-Forwarded-Encrypted: i=1; AHgh+RpWyer3LGwouJFlVZutBn8kw7smx96OkLswwZkohHG6kqhcCgxLrxBT+AZ+Zr+lkD2Gj+0=@lists.linux.dev
X-Gm-Message-State: AFuF++kz385M41Jvrc59P5wi33NaSHSCAgCjb8+j/JfOPXTR90+0MJIv
	4PtChkG+ekxdgpXeYLIeyIpgEGLM/l+xbnluLU29Hu5GLjfiEbUbuvy/omHg88vexBbZFefPM3u
	FWmQ=
X-Gm-Gg: AR+sD12xSSvejX3RIv2nRsF289hjPoFpQ9vrwK0d2hP19lCoJqZ8uc00+x0Le4wqEgg
	IJ5WHznAEkPHodlb1sf9lyfqcWubkRtV+lSRH541PdPtG1pSYxSsCk8IseberGeOR9mTKGbsD6G
	UpBdiOfQxgtrjVh8EBrBCfap63XCzd7jaW4kNi7CurVsL9dQ9h3pD/JrW2sf3EpolZ9FHlCubEJ
	hNn2uiYktKQ7/WQ6ipkwKRX2qSnsA8noJz99Hp692VkUA7O67A3ckMZSi/9Qrq3xhfbsZQZft6q
	4NKtVeaUyiHvc3ltCLqfFlLkl8e1dyHOfmWHUbCJ8iNAs6+cXgIKpXjld3fFjdE9Smd6E8nQeVM
	GIknDAgb7bslH3TuXVGOczagfQ3cKLwWZcwFR6OfuQvtvG6pQVZoISOUiuN55P6e/Oxtm08ljo9
	RP1Fmlor5mlEp6o4ak8XRB8R3u2aGBJ2c3MWcMwYOuu1kTZVf7choJCaG2nft9Jmhzu7Dnwcech
	3gQiIVKVfXlsxZbwVIKlMjqQfU=
X-Received: by 2002:a05:6102:dd0:b0:73e:bba6:bd59 with SMTP id ada2fe7eead31-77a86a6e6d5mr344850137.3.1787269276705;
        Thu, 20 Aug 2026 16:41:16 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777daea8e4bsm7656163137.2.2026.08.20.16.41.13
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 16:41:14 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-75609e844faso288814137.0
        for <soc@lists.linux.dev>; Thu, 20 Aug 2026 16:41:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro6ofeNWgs41ptKpBHE9ZjLeka1zZ9k/F5LJjHPxv+8ngtqAk+l/OCOos/886hQoIEa6uI=@lists.linux.dev
X-Received: by 2002:a05:6102:3032:b0:747:560c:e7e0 with SMTP id
 ada2fe7eead31-778f05babd5mr1953525137.1.1787269272014; Thu, 20 Aug 2026
 16:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org> <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
 <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org>
In-Reply-To: <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Aug 2026 16:40:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
X-Gm-Features: AcwNN1XRfcu1Y9Mu4rBPOaQuheZikf-15PdNleMMKujFPqm2AwjeBRozlHD45_0
Message-ID: <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 11:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > I'm happy to document. Can you please point to how / where I would
>
> Description of:
> Documentation/devicetree/bindings/ufs/ufs-common.yaml

Got it.

If you tell me that the patch won't be instantly NAKed I'd be happy to
post an addition to this file saying:

If this UFS controller has a well-known ID <N>, a "ufsN" alias may be
created in the "aliases" node. If this UFS controller is a singleton
(no other UFS controllers in the system), a "ufs0" alias may be
created in the "aliases" node.


> And obviously, as with every binding/ABI, you also need open-source,
> upstream user of this.

As I understand it, this isn't truly policy. I know DT folks often
want to look at an open-source driver to ensure the hardware is
described correctly. I also know that a badly written but
"open-source" driver doesn't justify landing your bindings. ...but in
this case, it doesn't feel like there is any complexity understanding
what's going on.


> > document this? As far as I can tell, no aliases are documented today,
>
> git grep disagrees with you, e.g. second paragraph of serial.yaml.

Ah, I see! I was looking for something more formal. Something like a
list of allowed aliases or something that would automatically validate
which aliases are permitted. You're just saying to document this in
prose.

Thank you for clarifying. I didn't understand this based on your
previous emails.


> > I think I've presened my problem fairly concretely [1]. If you hate
>
> There is no description of the problem at [1], except "bootloader adds
> the same type of calibration data".
>
> So I repeat my questions: to every UFS node? To every node? To one UFS
> node (but how do you guarantee that?)?

I'm sure it's not what you want to hear, but I guess my answer would
be "for these boards".

In my opinion, this would be fine as an ABI contract between the
device trees intended to run on Pixel 10 phones and the Pixel 10
bootloader. While I'm still of the opinion that people should be
allowed to include UFS aliases in general and it would be handy if
that affected the "dev/ufsN" node created in Linux, I know that's not
a popular opinion among DT maintainers. If upstream would allow a less
"generic" sounding alias "google,ufs =3D <&xyz>" I could do that, but I
doubt that would make you any happier.


> I gave you two solutions, depending on actual upstream need of this. If
> you have the second case - so not the boot device - then you basically
> want to re-implement overlays which you cannot. Use overlays, which
> gives you nice stable and build-time verifiable label/phandle.

I'm not quite clear on the "overlay" suggestion here. You're saying
that we should require the base device tree to be compiled with "-@"?
...and not because we necessarily have any overlays upstream, but
because the bootloader will generate an overlay dynamically? Compiling
with "-@" would mean we could give a "ufs:" label to the UFS node and
with "-@" that would be preserved. The bootloader could then use the
"ufs:" label to find the node. When compiling with "-@", the exposed
labels are essentially ABI. Did I get that right?

That's a pretty neat idea. If you confirm that's what you mean, I can
see about implementing it. It would also be nice if you could confirm
that this was an OK thing to do even though the bootloader is
closed-source.

We'd obviously want a comment in the device tree itself indicating
that the "ufs:" label is consumed by the bootloader so it doesn't get
removed.


-Doug
