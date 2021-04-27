Return-Path: <SRS0=97xB=JY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0A7C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Apr 2021 21:17:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E376561076
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Apr 2021 21:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E376561076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o3Q9eJwhDU0XUhTSpCtYGRlQFiO/JSaQGgrmslLPuAI=; b=rGpOOSC5RBb/saP81veb8yiqo
	KXdk0xvcWJHYxU9oJILk7wGijVEo/q+rpjwfdzbQGAxWAA+BTvoLVKT6BNkruMhlcgdjaAMYiKJK3
	STG0tbnTaBgsJxp3BpABpTBQMeoNeSfkj3APKqdKrc0rei8e2oy6tddG91xFCQouAbST8lit+pWOG
	nOQ1nnfnAHssaVYGrOA1W+8B0tLabnkVnVMtadbL7MYC6StxZlX+8Cp+TEQZ04Ya26owQ3Hdm6hmy
	A1K4R1PTTOmTQKqBwZLq7VZXeguQE4uJzthrsTRhrSLiY0FuxlKt3jCSFrsUgtfys5LR/2BaiqhMV
	Z2/G8Uklg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbV3V-002H1f-LF; Tue, 27 Apr 2021 21:15:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbV3S-002H1Q-9c
 for linux-arm-kernel@desiato.infradead.org; Tue, 27 Apr 2021 21:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HdCWf5Az9ImoC+wOF1n4xvdmgeHkYbIEFNOhZ+kSMbk=; b=aXYK8GBlyocnQrc7C+1IyMPcmf
 os3/2C9PGTZsQEoydQUVQRifaSWMIR3XAkGMr3GmAd5AXM42t4VPg7KLEwoUsZ4KBookLqE11C2gM
 L8fTphw81fREZvyxqQC58OnGplho4lX+TSOshsxRr4hnmEWKXxN2j6xyGtja+OOr79bT+EHxXGgJn
 Qf61uAT8ujCAQnyJk7ob+rc9Kjf0d/+VXj/Y2a9BTZtvvWWh7n1yjrxRyLJRfHrIhZ0IovXUJqDvH
 kX65End/48914JwdQ7ieRg/PCwluepnBaC5AGBCXTTHGzibW28EwLEXYJ6lLuiC2E191Xdb5GMOvK
 3cozflUg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbV3P-00H0x8-Ln
 for linux-arm-kernel@lists.infradead.org; Tue, 27 Apr 2021 21:15:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C218613FB
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 27 Apr 2021 21:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619558134;
 bh=i507szrTtHZfZLlEV/ZOMGJNqqalciaEgSyEap3nc/g=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=qtOOm4BK3JI8xSV1auZcVxYgYdz4kmWcFw7tl6nc9jiNIa2FGnXInKrdr6vle6yIm
 h0EJQuaQqnN35KsUxa5KY73Bp4ZxGUtuSm+gM85K9sXCn7Fbaulji4qXAjq+tdMWTb
 q/Z4IIcJnhcYgl/vGYwyntMLkgm1Te30e5WL0RteD/GzAXxxQScT/Tyckhzlet7wGa
 ID5qwEdMIrRFAamHYw5TZZHcZvZfC1vyhhzeT+Df1tN2Pobk2IBQgUHS0JrtR4Dsg6
 hWPNW3MoQqA9Jll29SQ+6qXk8qfOYv3xM0YqXKlzn5G6dUynvzCwQYuZCd7zePDHTt
 xGEQWwALoRWyQ==
Received: by mail-wr1-f46.google.com with SMTP id q9so6687629wrs.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 27 Apr 2021 14:15:34 -0700 (PDT)
X-Gm-Message-State: AOAM533jar5pZyFoNVsNk5S6vzOvgPuvRs6lGfdFCNq+bUfW+fJxQ5pN
 NeY+bF7y4fhT+GGO6hilX7uP/7C4kCpgXLmoMxo=
X-Google-Smtp-Source: ABdhPJwvgkH9IU3dceyL1THH2bO1xrcREUPiuDViOtI3gBoctKQJ1N5yrXJpA1+Izkij+05898svAmU+kOQszsbg5j8=
X-Received: by 2002:a5d:4452:: with SMTP id x18mr12863486wrr.286.1619558132858; 
 Tue, 27 Apr 2021 14:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
In-Reply-To: <CAHk-=wgDQ23kEkVVhjwcVPkQCDUVmJJdhO_HtjaRRCv_mtZgag@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 27 Apr 2021 23:15:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a23sx+M1sh2pXmb3Peuy5hV_0hy4KP7sfcXkCNXto0EMg@mail.gmail.com>
Message-ID: <CAK8P3a23sx+M1sh2pXmb3Peuy5hV_0hy4KP7sfcXkCNXto0EMg@mail.gmail.com>
Subject: Re: [GIT PULL 0/6] ARM SoC branches for 5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_141535_763132_A6212E5C 
X-CRM114-Status: GOOD (  14.19  )
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
Message-ID: <20210427211500.Nm_-jNx4XnQrG6D6pe1f56IjXVyv6CTgU9ywa0loH2k@z>

On Mon, Apr 26, 2021 at 9:41 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Apr 26, 2021 at 8:53 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > Here are six branches for the SoC tree [...]
>
> Ok, all merged. Please do check my conflict resolutions - not because
> I think there is anything wrong there, but simply because the arm side
> doesn't get the same build coverage testing when I merge.
>
> All but the two first had some fairly trivial conflicts with the other
> trees I've been merging today.

I've inspected the merges and ran the tree through my randconfig
test box for today. It seems you fixed one merge that went wrong
in linux-next, but you missed a harmless mismerge in a DT binding
documentation file. I've applied a fix to the arm/fixes branch now
and sent it to the list [1].

       Arnd

[1] https://lore.kernel.org/linux-arm-kernel/20210427210121.1080364-1-arnd@kernel.org/T/#u

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
