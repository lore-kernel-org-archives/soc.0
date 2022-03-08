Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A218C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02B50C340F4; Tue,  8 Mar 2022 16:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA1AC340F5;
	Tue,  8 Mar 2022 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757925;
	bh=BvuACGeXbeP1bLbpyNZb+43YQ7D2IBjf9sCvlyz6B9g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DizfbVMiQGUk8dJHciQJ4RyZ3FzRvB63Rfaud7p1A8Oh05x8dTvbxtu3YFNU88ejE
	 HRXGsI9K6v5XK1I7OONAla/gbV8k5YeBb5XVJ81//eg3f+AxdNrzUVof08ZTgN0EH1
	 GpK1hBQK3MsGIUEB5z6h+DNCDnnIdc+gQsORmmiPSDpGocsp27biubRXK8GSJtNsCe
	 9l2uats+dPQn9i8L3VQ2n8kjd4U+7Hf5h0ZnnysR1kmbo36ShMNXtS2o7oKy28McxU
	 AUuVVyGrAwpxWU5L12Y3CKEOamzNHDWpbbE7mEgq3DmXiseBflj+JpA2xjsAGgbzog
	 HLglP4iZ2zUPg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: dts: mediatek updates on dts32 for v5.18
Date: Tue,  8 Mar 2022 17:44:42 +0100
Message-Id: <164675781062.4163171.16962087279129392112.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3974dc7e-4185-4d88-ab5b-031a7d24214d@gmail.com>
References: <3974dc7e-4185-4d88-ab5b-031a7d24214d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:49:10 +0100, Matthias Brugger wrote:
> Please find below the updates for the 32 bit based SoC from Mediatek.
> We got very initial support for mt6582 and a tablet based on the SoC. Hopefully
> we will get more support for the components of this rather old SoC.
> On the other hand we get some support for the Airoha EN7523. Unfortunately I
> didn't got any response for the clock and PCIe driver, so I decided to not wait
> any longer and go forward to add the parts that are ready. We'll have to work
> with the maintainer to unblock the situation on the two left drivers.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8a6ea4edcf3e1c9eada53d64da192df009fddc18

       Arnd
