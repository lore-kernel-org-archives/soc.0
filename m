Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF4DC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 21:42:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7B523C44
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 21:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B7B523C44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Am0SK4kAkfKbnqIwYFfZAN6IgBFHd5gPrtwmy8JPmXk=; b=FFCrQqvXQEfSjFHRfD/zRaKh7
	BrvRmQBuo6BaD9KmEdBON9RoL042ydZF0TE1jlOos9ZbBHjqmZQ5SeNo1Xspvd/T81X8HT+zh8Iym
	etPpSuACuWlHEdDzo8YjNjII6oA+DVCWw7xxeQk8SRpZupnHlgxdEeh180Xb6wRD8tVqn6kMmk1hl
	mxtnFCxWKc//UPWWfX9f4eozSO9T/YS//SJ3FlLozAqRr/S4PeY8LFQsYLtD8RZYIGksaBJq9bohV
	5/Kfh28JN+qbTieCnOuGvIWvATWGM3FrEdASXR5Mg1OQ3A3wtvbaVmMm5eMnIeSOfhbE7U53rzkcO
	sN6lRLdGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn7Cv-0006x5-Fl; Wed, 09 Dec 2020 21:41:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn7Cs-0006wi-91
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 21:41:07 +0000
X-Gm-Message-State: AOAM5301dQuMYnafVN4modfbVhRkUWkDpm8x4Gjcf9t0s8kRKVIQu5cY
 zSE+EREDMfMXjUdTMzNEPiE5qJcl0NzLsdWaOMY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607550065;
 bh=4B+BjMNpABWXM3n7PCJ/W2GaQRP7WBAsFSLK9YRNYUk=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=Dwr5mFaAaynWP/7dNHqjy1BfsUx2k2Hs2nfrSEWdDQG3BESdVywW2NPos0Z0qiw6W
 vh3MmplTJOZ9qe7EzPeOojiTiqNGGfzjxpP+oWdgdmRtCw+8ox5nvsqDJKtqSfTN6Q
 ky1Tcj1ZRPy2EgVw6T+zbFTPwJLY3p8hgaTUkw26kF7GHhnNciG+smsx/4daa/QZ99
 g1yV2xzbDwy2aM6fHjp1YUsheSJbExaONIuD1TqZgzrmBfFhbY35RwmCE4a8L//1kN
 0kn2hblFovn22fdlCz2vYjn0fSNeYdjaMEM9eiiv67YzZZrw3KmDxzihW0O6ge+Gy3
 vfuKfXxBgwY1g==
X-Google-Smtp-Source: ABdhPJzPUyteN0KBUkcXYbviZy9ByW6Yy08enpG5Z1j8rVnDAR9zgBhDk+tIfS9/FDCEMWUMvLeImBFqADC4rJ9O+1g=
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr3190942oif.11.1607550064431; 
 Wed, 09 Dec 2020 13:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
 <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
 <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 22:40:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Kokj+fgRPGcSCcSW8x2=4_P1LJqmBp09_QtBRD0yf4w@mail.gmail.com>
Message-ID: <CAK8P3a2Kokj+fgRPGcSCcSW8x2=4_P1LJqmBp09_QtBRD0yf4w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_164106_416329_41C8202F 
X-CRM114-Status: GOOD (  16.72  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Willy Tarreau <w@1wt.eu>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209214048.r01Qc2vVjoqib8oCPjpQPBRtfibpf9GmHvup-Cn8fQY@z>

On Wed, Dec 9, 2020 at 5:47 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Dec 7, 2020 at 11:55 AM Daniel Palmer <daniel@0x0f.com> wrote:
> >
> > Hi Linus,
> >
> > On Sun, 6 Dec 2020 at 06:43, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > OK finished!
> > > Patches 1, 2 & 3 applied to the GPIO tree for v5.11.
> >
> > Awesome! Thank you Linus. :)
> >
> > Arnd and Olof: Sorry for being a noob.. Is there anything I need to do
> > for patches 4 and 5 (device tree bits)?
> > They are in the Linux SoC patchwork.
>
> I've picked them up from there along with the second series of DT changes.

And I made a mess, as I had not realized that the DT patches depend on
the dt-binding header. I've applied that patch on top now to make my
branch build cleanly again, even though it is not fully bisectable.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
