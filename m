Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DACC48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B106137D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99B106137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YMU+b7NcOQwBlU62kCyDncs71D0IQJn+eCxRFJO7Kk=; b=yVoAHN9m22MGSE
	a789mSQVOgyXTCIa8ea1bb9b6Jt8kVs06qNQNr5MCNI23w5Zzztpvh4MgEDwvEIVolKoblR/p3t8q
	Rqz8LC+9Ol1aWKofn5vPwimLnvsBDLNv5LdI3QFzPav30Ywyyi/J64YqbvL8hMGidxB2suSVwImbJ
	9hAEx4YaM48qjmZm/7YVB2NLK7x3ipIRn0hGTxeyrDdMcVA2kI+jNj7CXNjj/lE4/za/UjwtZJi2i
	zQYxxANI0jcelizDEvFu4YQI5h04J41+lheMhelRT0mSOl7TZA9CDfBB3i0geR+fnzsMhgSBw/9Kp
	gp8tu4P6Mu9a/Uyta/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltF1p-002Z3k-Pe; Tue, 15 Jun 2021 19:47:19 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltB2b-000zRc-J2
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 15:31:51 +0000
Received: by mail-lj1-x22f.google.com with SMTP id x14so25598133ljp.7
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pOcokHjn8C6eblfhNNWJ0wrgW2SVamVUGfojc7gGQjs=;
 b=swmvymsrhJ6L048X3+XStYbzujdk7jR5zt2V1M6/pTVdtObYp5LnqwfzCx0r99kO9W
 GY8NcGhwl/Gls7Sley676uGrVfa/yr87iknIs1gWqu07YJuYwqMaYDiHux/ZSdU6yM6y
 OGNrH26KrRzG9ftfskymNsZEV+ZJWfANr6n3SIvVfj0Ph23S6VZW4TS51eOzWsy9hloj
 ca3jKzYyMCAOofS3qUExqKEmH0QR80s4UeAQ4ZmCN38Q0AIt0lQy2hdhyATSkIUY1P6P
 AMvB1Uebqcl1hku3Dp4w3ZX9RCa8ksLeU57xBCQm3UBz/M3hJCQnJWGZWn5YoKXh+Xc8
 uiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pOcokHjn8C6eblfhNNWJ0wrgW2SVamVUGfojc7gGQjs=;
 b=BFnqu/7/xjiCrp1xlgVupUjlWrex1sqZmquAqsdhuudI/ghmGts+njsbhUTV2/WXw4
 4TnjfSShq/r5Q/0kalgRsvUzmmo7DLPIRfVb2m//W7TjKvbG9O1t+thoG0UtMCMhHED9
 5v+wYzIRdIIYUOVzS7V7bh8i0gFWaf1gs8lGEwWB4VWlwdBggYnDZ/XxOJYAF+PpoZxq
 Ay/QSIirqO9Nyl88bXdRgEPd6X86NBcHvug3wI/DktVxm9OO4tG5et46A/ay92nwiYcc
 zRXMvDoxZaUKHAw2/DlvBwlnt7ywHCScHMuhM2GGL+obR0BYh5Nq43HyGEjgA/yoV/mL
 R+YA==
X-Gm-Message-State: AOAM531xF1DFCXjIZ5GsccaizQ/Z27YwBRtHJF/enmt4K7CSvN/tLHMH
 qqLIIb/HymMRuj3srML87/QN2w==
X-Google-Smtp-Source: ABdhPJzfs0hjW6mrhnb0kSABzAozuBYwYUHvShyjT8JHAxKkozmbsrKr+yWYDxG5gwqAVxtNPmE/VQ==
X-Received: by 2002:a2e:9855:: with SMTP id e21mr152492ljj.295.1623771107330; 
 Tue, 15 Jun 2021 08:31:47 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id z8sm1056119lfd.217.2021.06.15.08.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:31:46 -0700 (PDT)
Date: Tue, 15 Jun 2021 08:28:40 -0700
From: Olof Johansson <olof@lixom.net>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Romain Perier <romain.perier@gmail.com>,
 Mohammed Billoo <mohammed.billoo@gmail.com>
Subject: Re: [GIT PULL] ARM: mstar for v5.14 v2
Message-ID: <20210615152840.GD11724@lx2k>
References: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_083149_697003_90884633 
X-CRM114-Status: GOOD (  23.40  )
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
Message-ID: <20210615152840.bsy_bOQOg2Y0Yy3dkanL_1Bvz4-xGY-pRXPhVtERPpo@z>

On Sun, Jun 13, 2021 at 02:39:59AM +0900, Daniel Palmer wrote:
> Hi Arnd, Olof,
> 
> Here is a fixed version of the PR with my s-o-b for Romain's patch.
> 
> Content is as before:
> 
> - Romain has stepped up to clean up some of the ~300 patch backlog for
> MStar and he added support for earlyprintk in the process.
> - In an effort to do things properly I've moved work on the MStar
> stuff from my personal github account to one for this project. So
> people can find it I've added a link in MAINTAINERS.
> 
> The following changes since commit 614124bea77e452aa6df7a8714e8bc820b489922:
> 
>  Linux 5.13-rc5 (2021-06-06 15:47:27 -0700)
> 
> are available in the Git repository at:
> 
>  https://github.com/linux-chenxing/linux.git tags/mstar-5.14-v2
> 
> for you to fetch changes up to eb5e7693630c6039d040e428840be82b7e3a8614:
> 
>  MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree
> (2021-06-13 02:12:18 +0900)
> 
> ----------------------------------------------------------------
> Daniel Palmer (1):
>      MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree
> 
> Romain Perier (1):
>      ARM: debug: add UART early console support for MSTAR SoCs
> 
> MAINTAINERS            |  1 +
> arch/arm/Kconfig.debug | 11 +++++++++++

Hi,

This time it seems like you based your branch on 5.14-rc5, which is a newer -rc
than what we have the rest of our trees on. The general rule of thumb is to
base it on the oldest meaningful rc for the release (rc1 or rc2, most of the
time). We normally base our tree on rc2 or so, in this case I went forward to
rc3 earlier.

(Maybe you had the same base last time around, and I missed it -- my tooling
failed out on the S-o-b checking before I noticed)

To avoid another roundtrip here, I'll apply the two patches directly, but
please keep it in mind in the future, especially once you have more material
for a cycle.


-Olof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
