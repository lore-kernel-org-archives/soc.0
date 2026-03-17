Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E9C3C3BF8
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752007; cv=none; b=iV8BdKcsFrahuA1HOkDjDfY5MprSBCF/al/IuXHg1ww9LD/p7m2EThWqNKzdkCThCbluhnJJYUsUvvglanSH65OzCiSdwZ5r9IdbVvjkHMJvUa71EzfjLUUM3tzFJpSqxh7L+kOrcxG08pnBu3Ptuf3kzE+mWWr+1YLblTPXo/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752007; c=relaxed/simple;
	bh=ePogIyXjLlgaIIlEoKDUPDPDneNsxCyX3vX62xgmKF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4I/UPzVt2FoH1ZlphOdR/V3HipJ9DiFg4tM2Y8Bf/qOkF4Mrwfu/FFwdObzoVOH7CsMcII/xwOMkyLTF6ZckKjrgoSf2/k/N62sD7lo8jmOT8VLA2ICOvtzL1L01a9uKJF0Py3YNkEloTrfvQUubaPKOW2nBS2XXeqcxTy4kdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 1A521C4CEF7; Tue, 17 Mar 2026 12:53:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F5F9C2BC86
	for <soc@kernel.org>; Tue, 17 Mar 2026 12:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F5F9C2BC86
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w2Tv8-0008Au-6G; Tue, 17 Mar 2026 13:53:14 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w2Tv7-000kBv-2O;
	Tue, 17 Mar 2026 13:53:13 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w2Tv7-00000007Ixy-2edw;
	Tue, 17 Mar 2026 13:53:13 +0100
Date: Tue, 17 Mar 2026 13:53:13 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthew Wilcox <willy@infradead.org>, arm@kernel.org, 
	soc@kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: Re: [GIT PULL] TEE shared memory fix for 7.0
Message-ID: <dfidrflp5p637dqnn2e6sqr6gbp47gimjlkechjjtlbr7re2e4@kgwofxcumhes>
References: <20260316074150.GA2474723@rayden>
 <20260317-illustrious-finicky-frog-90a86c@quoll>
 <CAHUa44HXjrPbPv0sBxzrW6o1iQVWdp2p-1-jroukZ8dxSvPmMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44HXjrPbPv0sBxzrW6o1iQVWdp2p-1-jroukZ8dxSvPmMg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

On 26-03-17, Jens Wiklander wrote:
> Hi,
> 
> On Tue, Mar 17, 2026 at 9:51 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Mon, Mar 16, 2026 at 08:41:50AM +0100, Jens Wiklander wrote:
> > > Hello arm-soc maintainers,
> > >
> > > Please pull this patch removing the refcounting of kernel pages within
> > > the TEE shared memory helper.
> > >
> > > Thanks,
> > > Jens
> > >
> > > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> > >
> > >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fix-for-v7.0
> > >
> > > for you to fetch changes up to 08d9a4580f71120be3c5b221af32dca00a48ceb0:
> > >
> > >   tee: shm: Remove refcounting of kernel pages (2026-03-03 09:03:04 +0100)
> > >
> > > ----------------------------------------------------------------
> > > TEE shared memory update for 7.0
> > >
> > > Remove refcounting of kernel pages in register_shm_helper() to support
> > > slab allocations.
> >
> > That's a supposed fix for a year old commit, not current RC, and the
> > commit msg does not explain what is the bug being fixed here. Looks like
> > it is doing improvement, not a fix. Can you provide here more
> > explanation of the actual bug being fixed to justify this going to
> > current RC fixes?
> 
> I'm under the impression that it is a fix rather than an improvement.
> However, since it has been stewing for a while, it's clearly not
> urgent. I don't have anything specific on the bug fix, other than that
> we're supposed to stop taking those refcounts. Perhaps Sumit, Marco,
> or Matthew can add something?

It's a long outstanding fix regarding memory page management. The
userspace gets informed about this memory API misuse via a warning print
incl. a backtrace. This gets triggered only if userspace uses OP-TEE
trusted-keys or the OP-TEE EFI variables. Therefore I would like to get
it into 7.0 but 7.1 fine too.

Regards,
  Marco

> 
> Cheers,
> Jens
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
