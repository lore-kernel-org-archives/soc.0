Return-Path: <SRS0=FEWR=WJ=bombadil.srs.infradead.org=BATV+b56869c198be7c3a2e83+6857+infradead.org+hch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEDFC433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 12:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36806C3411D; Thu,  2 Jun 2022 12:19:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 887B2C385A5;
	Thu,  2 Jun 2022 12:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 887B2C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=spjc1NV0tUcIwlyH3r+o1pjArgZsS0mBD5aKUtZaglY=; b=a8cqrPdTs/qxidHZhDFLhcaUr+
	rWxaXcKx6i+s1vcq8M7kVMAxI7iOCkQJv1b9eR59IFfXAhvJBtSMMmCe6GY3dYGLlYpd4PC5ZB4SY
	NdFZ7oVhQD6ELNWiK62a2SS4CeAXaQ2VAzHa+Vk1+TfaeGRoZ2gQjOkO66YR+sULeV4SYyfSq2nBh
	ljG7J1vhQWz/RNshKWkiNipOOJkRNvJZ6oqIDTtzBTA2ZKxX7Ok7jfPzTbAXk/G/KhfkS8R8S2+IY
	Hhe0KVRJgiGnaAx6aM4FaWN3AAOJtgVVSxQVtlc1mZCdJa/r12d55dMaVQlIgVtMpfSYJ98FQMVot
	7tx/UdJg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjnE-003B8U-45; Thu, 02 Jun 2022 12:19:12 +0000
Date: Thu, 2 Jun 2022 05:19:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
	Rohit Maheshwari <rohitm@chelsio.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Jani Nikula <jani.nikula@intel.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Message-ID: <YpiqwDjCP0Am8kZV@infradead.org>
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
 <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
 <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
 <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jun 02, 2022 at 09:38:56AM +0200, Arnd Bergmann wrote:
> - dma_addr_t/phys_addr_t are sometimes put into hardware data
>   structures in coherent DMA allocations.

Putting a dma_addr_t into a hardware data structure is broken.
dma_addr_t is the in-memory type, for the hardare it should always
be a __le/__be type of the actual width that the particular piece
of hardware uses.
