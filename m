Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B445C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 15:38:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B67523888
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 15:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B67523888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k14AdYzy3aIzlw5JKfovMkYJ2yDRDan3vFYQEA9nl9Q=; b=xZWXJ89FdvMgEuq3zyT4jODYb
	1qSDlgwsf23PoWhV5tyKLe58rPZu+prImjjztzA3LY9nixhweBAfy6BfsWVq/Vfp79HKz0exADHrK
	pXn8oXGszgGnX2Sg/mX8cvc62bEB6IUdFRAOQGHwCwFqCBWWXriWpbC2vln+dtrcLHyDWTbapcQcw
	5xjXbJVLOUj7Ahs1tuayNE5IEFX0qF/Avz8Z8FOlFC4CYVxcOacmvbFqvubgZZ5curih/fJGUCdU8
	/FxNqr0WGNIEOq3rjIk2nS6vfLZ97RXcxzoz0qYe/WBfvb+C55qYz+coZ/6b7dhriWI8GKA5Zy9Vc
	YvaTUstGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxtp8-0004aZ-7S; Fri, 08 Jan 2021 15:37:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxtok-0004Zr-4f
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 15:36:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36B1223A22
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610120205;
 bh=UTk9c3tMauVtqg14iuWu/6qTpsPgKrCg8YvLzVwrZCw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=TiupF4WDEzWkuzU4Z5UKbJBMLC0o2geBjK5icLvbINR1JgOkNezXRLqd0M4mQg4hj
 9EwEXE0gO7kX+eVZzPp4ErhRVT/8jU2Dxm+glIUD2EsXFAjqgrU3+lcrVdkqC3WSFu
 1f4tEJQZkIGemvD6ggH8/BBiUQXkR3n40tQFPy/gVphGL5nb9xrpraBlwLPEolyPsj
 4rIaEmHCrJvmGUhKalUaw0h9flZVC5sVmm9vDibVKSq8tcZsLBtCAHv+2tsulyN+mW
 aOiP7WHn/uTDutb9b6vzc0mWQV8Z69EEN6/Nbvbsu0FMiNByG4zqldsv6/gfaZW45H
 IYs/CeK3t7Fnw==
Received: by mail-ot1-f42.google.com with SMTP id j12so9979583ota.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 07:36:45 -0800 (PST)
X-Gm-Message-State: AOAM533iJam+M3Y1DKOwJDSFYb0kaTTQCj97NA8XqW2FfSeWJQqGYPYL
 BdspId1rtv108JTfyDwv6q+ycYT+fTAuRc7GXdA=
X-Google-Smtp-Source: ABdhPJxfVwqZJDSKG85b/uM3DaM/Uq2gY14c5gQe9seiQ+15OqLY5HzKeYu4FES/c/msile8woOwu8E3qOCx4CPEzlc=
X-Received: by 2002:a05:6830:1e14:: with SMTP id
 s20mr2988297otr.210.1610120204448; 
 Fri, 08 Jan 2021 07:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20201210200315.2965567-1-robh@kernel.org>
 <20210104162843.GA1875909@robh.at.kernel.org>
In-Reply-To: <20210104162843.GA1875909@robh.at.kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 16:36:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ed5C+Ym3ANBSSgGKVHrhVZJ3-pJAhn_PATRz7f61Adw@mail.gmail.com>
Message-ID: <CAK8P3a2Ed5C+Ym3ANBSSgGKVHrhVZJ3-pJAhn_PATRz7f61Adw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Remove PicoXcell
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_103646_282678_5FC49EB0 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: DTML <devicetree@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Jamie Iles <jamie@jamieiles.com>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108153628.9pQeycIg7MC8wRXA7_gkr5y08L6w_CQHWne3awku6sI@z>

On Mon, Jan 4, 2021 at 5:28 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 10, 2020 at 02:03:11PM -0600, Rob Herring wrote:
> > PicoXcell has had nothing but treewide cleanups for at least the last 8
> > years and no signs of activity. The most recent activity is a yocto vendor
> > kernel based on v3.0 in 2015.
> >
> > These patches can go via the respective maintainers' trees.
>
> Arnd, Olof,
>
> Can you apply patches 1 and 2. The others have been applied.

Done now. I've created a new top-level branch, as there are some other
platforms that I think can be removed.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
