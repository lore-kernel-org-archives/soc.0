Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ABEC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F5560E8B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61F5560E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRlHLURJU88V3v0qde7pEtKJ/EjfvMe3kE6Z0gUxfuw=; b=AitGVKUbp56LP6
	cWjaCpA0qulpJnbFOGSbPe3unZLxS0ropiLUahVniiEw6loZl0qZWUFgTuaT8XVaq/51hkueP103L
	0N1ByVyYAVp3MvSRoWJsfM7Z/YsyuqQhMVy2USlJlNn18jaaWGgBpvRUM1vvMZvusvQRp6QtYgZGu
	MhbDhcI+XyeZfNVw28cJqQsPfTTeePxzQEpTK9rY8A9gfibimTdfBYUvWE9zyZWYpPHbzNU9Ah/5J
	oFxho6kgRWe0vijVSXT4JykY0qjBBNWxMoI1+S8gEGQm84Ghsx0F2QjHBmJm5gauK0/f9rYLxDWgx
	vsGBDmA2tg4n+m9UWQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdD4f-004sRL-MW; Wed, 20 Oct 2021 15:00:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvN-004q0h-UB
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23C8661373;
 Wed, 20 Oct 2021 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741437;
 bh=mpRePlm6u4J/C/3COAhH2LODj+z/wdm5n9+Lom2qZa0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o89qH2YXoae4AgL4xTj58Wf2vOrFMpWcBypDqj/d7gHBWLPZg1VuCNN5DD0aZYAHJ
 Auud8HvPUbl63B7qh/m2oss6KQo8qWr1NsBYXZkKoDrSq3S5to+4w5Q9cEhEV+zZH9
 +RqqNAXi+Ow+sU1B0Z/lV1TbOuWq09wYEewmZ60+z6CgZihkwWp1zuSZF1G+iI9dKT
 eNOYCQjFG9lHfR/hLcDhF9aqpm76iOTpchjNA9q0RxmkG8MJQXpFL4d4nPY7EXpNiv
 uVuuBkDhsEk9SmgdNpAhkwwBCtZ5sRJjPxpSjLUsQnOFjbfKyEUdzGMeZK2McPlkgA
 wbaweosb6KfHA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Olof Johansson <olof@lixom.net>, Andy Gross <agross@kernel.org>,
 David Heidelberg <david@ixit.cz>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca@z3ntu.xyz>,
 Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: Re: [GIT PULL] Qualcomm DTS updates for v5.16
Date: Wed, 20 Oct 2021 16:50:12 +0200
Message-ID: <163474139750.4099414.12479165813622902564.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211012174310.1017857-1-bjorn.andersson@linaro.org>
References: <20211012174310.1017857-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075038_037577_6D8A8729 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211020145012.qTF72vq3LYigDSQvPT5xDzLXgyT9PPQWB4QSErFWzcU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Oct 2021 12:43:10 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 878e26d3601ba5232d94749ad9f8989d8247b358

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
