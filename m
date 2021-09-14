Return-Path: <SRS0=cUWt=OE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC44C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Sep 2021 15:28:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22C9061157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Sep 2021 15:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22C9061157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIkO+AJJA3N5AF+sncCcwS05GPU8kafSJMJKU++3fzM=; b=Pb24byGU9m9Qhh
	I4HGmC+MUzZTlx2cE39HBIkvcJrwrxF7Ma+1ctjZdX5Aa03D0SdYTj3cOHVMPxMQpNYr2a8pK2ocQ
	l+j+O8WZBHCeMQcUZXZwbdLVlYnUmIGJQoSWuGsO+A8MJidv0KI9e9FeH3KHkxNcUKDi3+ROgEopf
	yIzhgEAW3FSXGqqCq1tmQGR3AEutyxvNIH7v1oEJmtRM7wTyVOfuSHYp7UOB1GHNsk9d8hQvP1dT3
	eC1hLmhcdcW8jBxB+YkGQ/2IdzG4zBz7WhbsBTVCryJ+0qnaOP/RC+320ogHPmOb7sPrPKB4zfXP1
	+R+gFm2VHI+IlwmtkqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAKR-006Dc1-FP; Tue, 14 Sep 2021 15:26:35 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAKM-006Dau-Ve
 for linux-arm-kernel@lists.infradead.org; Tue, 14 Sep 2021 15:26:32 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N6LIF-1mxJEb1xw9-016dbU for <linux-arm-kernel@lists.infradead.org>; Tue,
 14 Sep 2021 17:26:28 +0200
Received: by mail-wr1-f50.google.com with SMTP id x6so20855664wrv.13
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 14 Sep 2021 08:26:27 -0700 (PDT)
X-Gm-Message-State: AOAM530zQWDTs6BoIFXdEipcLv/nJ8QKine4EidwUnEAfjyq8taPQeDS
 unuTHFMOPEV0PBdh+lPVk1wqKM1yyKCXV2Ute/Y=
X-Google-Smtp-Source: ABdhPJx58PLXLbIDPH3agyMnNUczBn+6WHGZgh2cx7ovkyQCQ1tT2E26eQzrosGp+LginhSbFYIKP6merOG8OWf3s2g=
X-Received: by 2002:a5d:528b:: with SMTP id c11mr18953468wrv.369.1631633186700; 
 Tue, 14 Sep 2021 08:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com>
 <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
 <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
 <CAFr9PXkipBnVDBOpdYhUD4bYNaL8qybPhGJi7YwSHaCNrPz6rw@mail.gmail.com>
In-Reply-To: <CAFr9PXkipBnVDBOpdYhUD4bYNaL8qybPhGJi7YwSHaCNrPz6rw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 17:26:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=GTcgbqkwnzsFtBtFZTtf4Lop7U5hsCAid-fCgs07yQ@mail.gmail.com>
Message-ID: <CAK8P3a1=GTcgbqkwnzsFtBtFZTtf4Lop7U5hsCAid-fCgs07yQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC
 maintainers
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Romain Perier <romain.perier@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:q/JG7NvTDf09wNeOWglyy2EmXEFo8tCNzrXM7Fc1VZN5zONicW6
 bRMeTOn/21E9FqIg2KM/LDiqOC5Qfx6oD9mDA8sdWjQidpy9TLSxvTUSRf4j792k3nvOZs1
 O0MUi3ALvODbJtFwy4jxzX4MsPU7oszmjbNxFnMRksbbeUrZwmrb8PesXEQiumovwfBm66e
 RvUuWM/GElUi6oNuzNO7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8jy+h11j5pk=:/oPFKPU10OWFQ0+azQQa6b
 7X7ydn2cmrpddYWtdixfRH0sGrUH3KXZL4tiRQqDGS7fQFYkhdKeLecpnRkU5NZi5IqDQGGqb
 MtCR6h65LfLty/0atHAiqkDrs0uUYhvym3ROfzQrzvR1hIu1Q7glB88weN6myX4LZYyS0Jwm2
 ITicpFkl3V2zGX3n2AjQMy0nnWlXTr6uIxeRspGEVrfrMRob8ki8SyfRRrrnjZuRo8lXfiA8f
 jQExUEkKpWrHwiex5xRlkXK1+x7r9/OSP3p0Z1U/Lnso9gto/nqx9V7bZ95NSg/houE9jr2qO
 6seDkvxsuqj30ir5J3VbazQKLy9C92VCdNXDzbJIsE1lWnR8hCa4DzbDafb0HfLmw3govT/Z1
 dvZDroYX9/ZsNg2CXYWUz1eoBOLLpinN5uyy4GQRzkq5hGI/wteIs8FZppgupRw9iWmOl2Pvl
 YJgplZk9JCC0THHUenHRID3tlSP1u8EjYWpIrILWrOAZ+DfL1rRsd/+4i9uIqhQe/uevPAdpc
 9ZU4pxRD74bpdVoBBfJG0GlE5cwCuWM1oY8LWyY7Swhbw6rpZhVJC6XEmjshKEER1uc7Yqif8
 VSBBvZyIuASCwxt+Ik9xi6xgO6lcivOF6DNEgbg5CuKN9xrzIGyq+pQl6LgcsaYEUrJiSEo92
 tIz7Y6m+IKGrNuK+iEueqB5n/nnFL2qVwtYKTJ3+xbDuvQoTj092jUsVp5/J4S8mGfe9paJwo
 7RerX15kzCm+m0wpHwhI29hB7Vd8KvZSn8wudg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_082631_346391_0E8A3324 
X-CRM114-Status: GOOD (  18.78  )
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
Message-ID: <20210914152610.naiVsGyusiPbf9b_3tTofLoTeN2hYqpowPYkjGvi4gw@z>

On Tue, Sep 14, 2021 at 5:03 PM Daniel Palmer <daniel@0x0f.com> wrote:
> On Tue, 14 Sept 2021 at 22:54, Arnd Bergmann <arnd@arndb.de> wrote:

> > FWIW, I'd suggest merging the MAINTAINERS file change as a
> > bugfix for 5.15, it's generally better to do these as early as possible
> > to make sure any patches reach all the right people.
>
> That makes sense.
> Would it be possible for you to merge that single commit for me?

Done, merged into arm/fixes.

> Seems like that would be easier than me creating a fixes branch for a
> single commit, sending you a PR, finding out I still don't actually
> know how to do PR properly.. :)
> If it's a hassle I'll do the PR though.

If you only have one or two patches, sending that patch to soc@kernel.org
is usually the easiest way anyway, unless there is a reason to keep the
branch description separate from the patch description in the git log.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
