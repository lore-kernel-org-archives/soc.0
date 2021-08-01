Return-Path: <SRS0=3Suw=MY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A03C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Aug 2021 09:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B21E361058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Aug 2021 09:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B21E361058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=059jL8VxdmN24fTjhhRL5HTKf3YRvL0AjtCAIMSLm1o=; b=Dw6ZBTXTyX5V8y
	Kais3qAYa05y2M2scthZiXkWMkPtGP+NQaPD/Ueg5cySFFuePtUndccWcoT2Zv2t4NkzBu5vaeqi9
	UwrWw3ogjGlcJOeOMBn5Drt0f0T1JMKP+vO/SbfajKHF6FFv2xT0pLUbAvQ6/0sd3XVjBUCwWF1sP
	kwCp4WoIAmgLEhpA0NfCsKlc9r6+Iy29Y5Iwlj+kq6cz0zb1PLTHQCriNMXhll9myy91ahRB8ODK/
	pC51NAUAGL2zMa+JMUhm0mRjtUyw1RGwbj6InhZuz2wS/FAVOidVgCoopdeq9m0PUOKt8SG0ef1OX
	ceeuEipCyqw2KWRDbOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mA7yA-00D8v3-PI; Sun, 01 Aug 2021 09:41:18 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mA7y6-00D8ug-6a
 for linux-arm-kernel@lists.infradead.org; Sun, 01 Aug 2021 09:41:15 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8XDT-1nES3Q3SN7-014PiU for <linux-arm-kernel@lists.infradead.org>; Sun,
 01 Aug 2021 11:41:09 +0200
Received: by mail-wm1-f42.google.com with SMTP id m19so8629059wms.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 01 Aug 2021 02:41:09 -0700 (PDT)
X-Gm-Message-State: AOAM530b1jq/iuUUHupHNuk+wNFHyQBd5+4XwI63+tw7WrmnZ6ZDDDM5
 xfcAShht62xniGn5NX9IJ4Zm6jBxJvjcywKW1PQ=
X-Google-Smtp-Source: ABdhPJy9Co8LhMruzZGyj4f3XArmEpslC++FxInWAY5kS6dN4F5T0Wp45K/4NLUe+uVYPfHG9aIG+H5EtkfDpdNsprE=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr11249018wmc.75.1627810869409; 
 Sun, 01 Aug 2021 02:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <CACRpkdYvMtE8b-Xiy6=Aiz20jvY0M0Bz9XmcEQDHhqeS+LErEA@mail.gmail.com>
 <87y29n26po.wl-maz@kernel.org> <0fe113c6-4160-fd3c-488d-53d40b6043ee@biot.com>
In-Reply-To: <0fe113c6-4160-fd3c-488d-53d40b6043ee@biot.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 1 Aug 2021 11:40:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3HrzAYtCnLuThO=9LuwyF8KduNjx-ZrJkXG=Y-i6RNbw@mail.gmail.com>
Message-ID: <CAK8P3a3HrzAYtCnLuThO=9LuwyF8KduNjx-ZrJkXG=Y-i6RNbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
X-Provags-ID: V03:K1:n1XrCf9PoF+aaG7T3yG6MVYsgmLevJwVCbBAQSKIXPNWZzDrjol
 h1SAIYly8VF1yFhsxaseQE0zcXjkPT9zC527a8gdSAak76Qlp2qeUPDWW4S03py+6Hi+/5G
 miCjXXVBkWu9tafVEmOkuudhINdqi3crBlqnVS++CC+FHedU6M6k4bPoQQKI6qXenrr9cXG
 h4r3XpsR8UIE+NrEsjkSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yrfkv6SwUXs=:mulXj1i3fcjkHTNEawo7Qp
 5yxBzCoWOIgksbpiOIWmC8oQgjlERRXyTJz8dA/flz5VOkPqwoDzS5GtNIXNM3GzOCKbyc0Fr
 1nMGf3xBaLGkk21v7VP76b49V9We7w0n9yy4Yn+pTy6AC5xnMS07wFOurgZgLJ3DEeUix+hja
 8oWhnZuf9p1Yk91xdxxPZyOyqJXeSOjwkiTK/JCnVgFPHSFAYouAuRcPn9D6+H7oZZZWSdKI4
 jeD5f+5vuRN2syOfQ/pYmTcGc2LFWgN+tsMiGALtHbp1FbnBlNc9ToIs0SmZztZkcA7u7qRBY
 p7u1afdNRmpigDRwCytn8uIg39f8HVVu+av4f9n7oLfomCTzuUTaQM+tunXEOqbuefu9Ty3lb
 s1mnDeX4L7OD/Y+WwpQ5k2sJ2CbTmRaW6bYz7a/W0FB+ruYPqOBPcevhNZwU6rgOhVg7Gx/ZP
 /rxzkYVks5+ekEPm9K0hlpd/AljH9dh2CFcT9q9ETM+YRsgoMs/yhPPDfuhUqQQZhKwmcZJbi
 qQtnKURpQeNSJatu6k8i31O6N5KPIMIBRLbLp48nrCgbpxJjDja5MSbnOkacHoipmbSWPSszb
 6GQ0sYf5U7hvXhrD5lTDowicFK9Ntm2Vs4DHbu0hiqRwtOhCE20IzqoDkXwv4HaARpYZ4xLuj
 hh1MIV4w9M1b1jaazbw/SI/qtaTCxKgl4GhqbWGCLEY7fgVKKp95qkyY5ZxsMr+rUUIkk4WjG
 30gHB/JSStORalOACiGkAxhtQvpJ1UGCudKv6b1IqrBaXqT5yxMwTFxSN0ppdKItLDqv64q19
 onIMzZ6/fU6FJaMdPPfVw6BcBW8NFWKEZNSswLTzqt5E8Oq2cUJ6Cn5s6T5UMjsX27i2JxPTw
 zsyOKmXygYKAiyn9EKmQgTFeF33tHcgAZ3R//0fLyvuW/ITxuO2t9zJFILW8L+VBPHCMvdIow
 /WjXl0D4qT2NphX5q+DHnvFn/uIwGAVKX4k5eFdQZmaDikSkHyokN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_024114_579746_16A6D9FC 
X-CRM114-Status: GOOD (  17.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210801094053.MM13x6VG-X92QreDpMI1wqTS71O8INqH0WOB5VOwv4g@z>

On Sun, Aug 1, 2021 at 11:07 AM Bert Vermeulen <bert@biot.com> wrote:
> On 7/30/21 4:53 PM, Marc Zyngier wrote: On Fri, 30 Jul 2021 15:31:36 +0100,
> > Probably because that's not what it actually is. My bet is on A53 with
> > a crippled firmware.
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.14.0-rc3-00042-g3af70c6f8e95-dirty
> (bert@sumner) (arm-linux-gnueabi-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0,
> GNU ld (GNU Binutils for Ubuntu) 2.34) #392 SMP Sun Aug 1 10:28:13 CEST 2021
> [    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache

Good guess! CPUID 410fd034 is a Cortex-53 (d03) indeed. I wish we
would just print
cleartext names for the CPUs that the kernel already knows about here, I think
the fact that we just print 'ARMv7 processor' (which is wrong) and
spell out the revision
but not implementer/part/variant numbers is rather silly.

Is there a way in the boot loader to boot up a 64-bit kernel?

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
