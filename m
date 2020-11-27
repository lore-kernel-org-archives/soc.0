Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD0AC3E8C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 19:46:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1AA2075E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 19:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wIfyUfhD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV5hGtZd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1AA2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cazQQpkkOzYFC4p//oPcg0GX4V2CHKUnKXdq6NbfL58=; b=wIfyUfhDLMondpk0iio3vWbC0
	V/10OwXoA3AgON74bsb24NcnPjF1qZ+fGqyCic3zqNEwQlGGeLGlcg7n36u9uiK6+t0Kz7fH/6dA+
	KhvKksG1IE4GVKYCHUIGu3uCe+51771Pjdj+hpzlLIDr1GWhmb7CKB5qQVGwZZsOoZ7XUPGSSJIxB
	0eJjUHV3rAUU6cJXWDnnudwWHJPbSVQYfTWoqEDNdUVUm+zPjLGH+yqWfDJ3ramlQIdtEc6C4ApLD
	D+gVWokRT8dYzbcJEuuJdToKgDqkGJMaFb/BtKdSsHxHKzzdKE0DWdOzxkZP3/gfuI+4sXQQsqcrk
	w7a2eND8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kijg7-0005tq-Ir; Fri, 27 Nov 2020 19:45:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kijg5-0005tI-7j
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 19:45:09 +0000
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD13724137
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606506307;
 bh=/nFIIbdCgdcVm2qLxpVFyfzz6wSNmIf9UB5D7XhHWjw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=IV5hGtZd27vdRjuMwWdGd2hp/XkJGTtDo9/JbhTUK/9XI/Lrr1KlkohF4TbM6S+1k
 ueYLQ3uAMQT+1bpMqpNZ3/Ro3V/BrxilOgycl9hcN/6t2Qqf0/iz7rVssG850Z6M4N
 P9kFnA/cX/SGs5aXZLz4ejL8ahvlBhdFIJMw2r20=
Received: by mail-ot1-f42.google.com with SMTP id z24so5612285oto.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 11:45:07 -0800 (PST)
X-Gm-Message-State: AOAM5334FF+nq8Dd6KtGoYm66r0HJbifvn7hgbHjKsPUkPXY9RK83z4y
 vMvsqxJN+teXCypAIRXczGfcU+iHqk8z1U2fZ+Q=
X-Google-Smtp-Source: ABdhPJxAJIMAFi0t99Si8IUlccu1IFVQVEM5rk2SCFFLDp5EjAKPWl3XqpLr8TbN4D5fmrqszqvVxkUjfIjwrLBoQlk=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr7461137otk.251.1606506307179; 
 Fri, 27 Nov 2020 11:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20201127144329.124891-1-thierry.reding@gmail.com>
 <20201127144329.124891-5-thierry.reding@gmail.com>
In-Reply-To: <20201127144329.124891-5-thierry.reding@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 27 Nov 2020 20:44:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2vcd0QgfwjTTPM1gk=tTqD+n-4ww-vhJQ3M0z_AZMyDQ@mail.gmail.com>
Message-ID: <CAK8P3a2vcd0QgfwjTTPM1gk=tTqD+n-4ww-vhJQ3M0z_AZMyDQ@mail.gmail.com>
Subject: Re: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.11-rc1
To: Thierry Reding <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_144509_359094_21AEDC8E 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127194451.z82kLYAuRz4MWDQ2ZSlRS9EV2yCj-Siu-O85RPowY8c@z>

On Fri, Nov 27, 2020 at 3:43 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Note that you've already pulled part of this earlier as fixes for
> v5.10-rc6, but I've included the whole lot for completeness. Let me know
> if that doesn't work for you and you'd rather have a completely separate
> branch.

The way you did it works best in my opinion, as it helps with bisectability
and it avoids the backmerge of a later -rc into an existing branch.

     Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
