Return-Path: <SRS0=cpLJ=RY=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FFFC433EF
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 20:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6081CC36AEF; Sat,  8 Jan 2022 20:30:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E35EC36AE5
	for <soc@kernel.org>; Sat,  8 Jan 2022 20:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E35EC36AE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pj1-f53.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso11321649pjb.1
        for <soc@kernel.org>; Sat, 08 Jan 2022 12:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M4yvBydEK/NIDIJw9qV00Lqe8prv2t32shQUOHMa500=;
        b=4T12OgTBFbdce2sNrlGayqaYvDHagwSlO11vs+fFnqsgJTPh6ZjGHvay96ImLvw26R
         Av4VYcAEcQ+NMqOKc9hD413YYrXHpg9lRvkI/BXIe34FUFH7Cv2pTHr8KdZz/oyIcRLk
         uj3eS0x1I0YdPMdOBDqfOLwbweUwfdfWHBfaOOn5ZZ0PeE4ZRFMAXvJDdgMUXe3kzE7c
         qmNxny0ssHi1WOotDrd40nW4FVumRSkD+zjIaggmn4/KEQOa6qNfjXKNxH6AqVuQ7/fd
         i1oYJA14FJ5Dh25NzPnL0AQM+1GxpZEx2fTPQoat7HAKlHdTqn/C3p4FNRceAd0RxS9U
         J5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M4yvBydEK/NIDIJw9qV00Lqe8prv2t32shQUOHMa500=;
        b=EbMOsBNCZySVQkE8aEuQKSuko54YQxeQcDzT9XZYFRHsB8nIHaeHDwgYH1rgX4jED3
         LBD3lSoNVPbl18Bv0Z38jnQqOSIab/5loQJsuJQpcCi7az51cjtRHaZUPlTLQd37Zr3V
         vEu4oVmEfOs+cljWhsQtdBDREFOKtUuArSyW5w1DCvHgrTf1LSfyBC/i40LAUWrVrDZI
         OjCdgBBPFF1DJSb9svWQsY3km66skuUxVLb9gaStLogshp0ffwrZE3dIRmiidBtfpcjK
         Qo6Pck2c8x2K4Y3Cckn4kyOYutTx0mu/uPFt/t1Jy43sXrBTU9D2kXUUkY1ZIOGsA6N7
         nPQg==
X-Gm-Message-State: AOAM532GhdlHEwtJmcj+i+w17u37E8QXoWFCjeqczTm6V18hhRuYwSZ7
	jvk0rR1v93r9zTByX42lRhfPJQ==
X-Google-Smtp-Source: ABdhPJzvrR+exCwaXGGQhi6pWi+zMPsElWGemhPKd9lz/9u72bPSnO9/oLN9VMnb3u3NoZ73SQDpug==
X-Received: by 2002:a17:90b:1b0d:: with SMTP id nu13mr22027353pjb.231.1641673807653;
        Sat, 08 Jan 2022 12:30:07 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id h11sm2611983pjs.10.2022.01.08.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 12:30:06 -0800 (PST)
Date: Sat, 8 Jan 2022 12:24:10 -0800
From: Olof Johansson <olof@lixom.net>
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.17
Message-ID: <20220108202410.GA1057@lx2k>
References: <20211222141342.56395-1-sudeep.holla@arm.com>
 <20220107113740.f4zlz25largdjcfd@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107113740.f4zlz25largdjcfd@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jan 07, 2022 at 11:37:40AM +0000, Sudeep Holla wrote:
> 
> Hi again,
> 
> On Wed, Dec 22, 2021 at 02:13:42PM +0000, Sudeep Holla wrote:
> > Hi ARM SoC Team,
> >
> > Please pull !
> >
> 
> I am aware I sent this pull request just around the same time Arnd finalised
> the initial set. I have seen emails suggesting that Olof might be planning
> to merge additional PR, so it would be great if this gets included in
> that cut. All the changes are in -next since 21st December, so there should
> be no surprises.
> 
> Thanks again and sorry for nagging.

Yeah, no worries -- I'd been letting pull requests sitting for a while over the
holidays. I've merged this into our late branch now.


Thanks,

-Olof
