Return-Path: <SRS0=J3As=IB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A38C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 17:20:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B1F64EDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 17:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B1F64EDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3axlQ5YGZv/FVsX9heXfu60dpbTeDwrGsNUZ65/tlS0=; b=MgQ4JRQOifH83eqOzJHeIWdZz
	J0KPzO6TbmEN4JbK6UgsxYDT2ZENbCwHEab7rOlz5/q/fwAvNEkR8wBm/W0iZpnHM6BLPHKzwCQ5I
	Nbu0IXFYohjeeE1XjV+cVUb0INcu/4+Wax5XW5m7aYtPxlP1KPxUgr5AzwKkxrOwKIiaLSPwfg0ho
	jlaW4mAmL8MfsMtScQeBLUDCmNnQoJhwxw2O2M8NtZfZngZi6HLpXYTCd9CtXAGve/Zu5vQsRPe0a
	q+IegGAyCQ2bKgBw4nV5MnSPoMTjX8lZ6GL1EVpvMaT1PSfgedZ/HGPedaMD3UBKmgibvZTlN5wr/
	AatHTUnXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHV8E-005lY0-GF; Wed, 03 Mar 2021 17:17:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSte-005F4E-Q5
 for linux-arm-kernel@desiato.infradead.org; Wed, 03 Mar 2021 14:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=91iuIsIThd4WfjoDLoq+V2mu5/658TgeDmNKaEFlDRI=; b=b544t7SHOyXSIaNS8Cx7EpC4Ef
 KSAjcTwgyn/CZn2GSoblDnohQBQ0ISV9aK+67QQvEZGZik0nQ3v16GgXDrSp6qrOnyyQZgF5SSmAU
 iDs0lFfVKC7h6sxf7yGgEf5nPAUPFkJbdq4mGghDFESNoA3yT6Qv40CVUwRJkWWI8PDJGXgIYkAr3
 8AxzGpd17lryp93VmTcy/rrsSWOZRbsVv2bP+GcWzGhUw8HVIgU1nn0oR1dI7XMCIv9rxtcRLyeEL
 0QmwKb1RcQVebUHWF0Tr6vy/0F4DQg9S4zAaL8EeQmS132NvlN1L3B78gLxtKXwNMS4KoENcZO4a2
 eXDVaNbQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHRdH-002nh0-99
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Mar 2021 13:33:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9872C64E67
 for <linux-arm-kernel@lists.infradead.org>;
 Wed,  3 Mar 2021 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614778407;
 bh=BZYBZXYWmo2dKv8wyho+LMkEkeOqULwa2LYgfaB47ao=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=NqBQUSlok/yAIgXYky25zEnz2L5xUJJ/PRNmXIH2WaSrk73yvg5fJytBftRQnpGV7
 pQxdKT+E82xhEMy+X3nQGFJRe2azwj/2UdWc4uNjr2ggt9sFJXV4xP+L0Ntbosdt/K
 jkjeWzhhLSQKm6iy3zhFkp29Erzs70iNAt+qbCe9hAnlf/DYZzqGDWfJACEqYqOcsj
 weg7yphZaAkVLcSsqfBO++AamTuXXRJyrAGyxCwTTbFer0w9SxMZVgBUXRzTJLypgL
 4VNk5NN2Tb/eS+/C5XKwQ9Y2cf/GyjcMSVeawvU93aD9GfVxhOMReSUEjGk66Dt6Gp
 l7TasrpXMFXTg==
Received: by mail-oi1-f176.google.com with SMTP id d20so25906069oiw.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Mar 2021 05:33:27 -0800 (PST)
X-Gm-Message-State: AOAM533f7Or9dcUktEMhDHW2odGIv+d4RXqRLe0MwpFIDQCzVSRN5VUQ
 vPmc2btGZeON3HYWDmJdbQCH2vlaD8vz0Qi1EhE=
X-Google-Smtp-Source: ABdhPJwwV2gnP5NFzQWkEiGAvINhXSCPNf6IDELJwNFQmFLhB2+/gtvCfNL0h2bWqoby58huOSZSdMHK2xdxydqyThE=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr1620792oie.4.1614778406768; 
 Wed, 03 Mar 2021 05:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
 <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
 <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Mar 2021 14:33:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
Message-ID: <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_133345_054831_CCCFD39B 
X-CRM114-Status: GOOD (  21.45  )
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
Message-ID: <20210303133309.q4ulaRC4HGXh7NlAwqBaQNJgGL4h7uWLx7dOuKJBB08@z>

On Wed, Mar 3, 2021 at 12:20 PM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
> On Thu, Feb 18, 2021 at 10:49 AM misono.tomohiro@fujitsu.com <misono.tomohiro@fujitsu.com> wrote:
>
> > I'm also running out of ideas here. I don't think a sysfs interface would
> > be any different to your earlier ioctl interface or the the /dev/msr approach,
> > they all share the same problem that they expose low-level access to
> > platform specific registers in a way that is neither portable nor safe to
> > use for general-purpose applications outside the very narrow scope
> > of running highly optimized HPC applications.
>
> Ok, but ARM architecture permits implementation defined registers at the
> first place. So can we provide some method/interface to access them as
> CPU feature if these registers do not at least affect kernel operations (like
> this barrier) and only root can access them? Library could offer portable way
> for user applications (under root permission) to access them.

The kernel is meant to provide an abstraction for any differences between the
CPUs, including implementation defined registers. While any such abstraction
will be leaky, just passing through the raw registers is generally not a helpful
abstraction at all, as seen from the x86 MSR discussion you pointed to.

One problem with having a root-only register level interface is that this
can break the boundary between kernel mode and root user space, and
this is something that a lot of people would like to strengthen for security
reasons (e.g. a root user should not be able to break secure boot).

Another problem is that exposing the raw registers from kernel space
creates an ABI, and if it turns out to be a bad idea later on, this is hard to
take back without breaking existing applications. Not breaking things that
used to work is the primary rule for the Linux kernel.

In order to merge anything into the mainline kernel, I think the requirement
would be that it does provide a sensible abstraction inside of the kernel
that can directly be used from applications without having to go through
another library that abstracts it, and that has a good chance of being
supportable forever.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
