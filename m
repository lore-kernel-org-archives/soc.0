Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA756C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 23:22:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62CB621D93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 23:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62CB621D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Af/28KnNSiVtPlPs712DlHxzJEKhbBK6ChCrq+kyM8U=; b=oDOQWvG1CJB9SHSXGx88GKwz/E
	2B/Cd32x9Iv6rY2X2vxR+hi+YoRO2A9nyO4d0/+Qi6dxNWAGhDFsQZp+04r1HB+fWgKWejJwLS6O4
	x6/16GN3CNIya95Q5+NwURQG88VqwB+vpq8U9Wb1dzl25YckjNR8YPm6a25OfM2XwWrbRQFJZWqu0
	X6tnND2COpunWgIMLAahEPhaX+gSKN00yuxeKxJa71iBiopqQq7GPE+CP8pbg0ppyCP542txss9/3
	nhunS4IhKd5JGCTPZ+paQ78YbU5Y5QH8C3eThWjjg0Ib90aiWVL2XlrSKMjUZ+BClMZO9T2hW8BGD
	36pedf9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4BA8-0005gI-IH; Mon, 25 Jan 2021 23:20:48 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4BA5-0005fy-NU
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 23:20:47 +0000
Received: by mail-oi1-x22b.google.com with SMTP id x71so16614570oia.9
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 25 Jan 2021 15:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4y3TSxNQdi+jql86zSjoCm2QszJJK7xRnAAsAbT1tw=;
 b=rmFEPXugDo5gY7Rv2TY34qw6TFNSw6s0EgRcXS5pB9t7vCMTKSfWbozn5F2qgyhAlD
 tfJCfjOeTxnH3lgOn8I7qAmOibraSltZ8WrpC2At80Qe71tJ9J6gK+DUnVrX9CxyRwY6
 372/rzPh48hqu32zTCotwoxBFjtr+ZC3+0ADWqcERz8ZEwX4c9wDdcJv4ieuQrq+YSjf
 fInTO94rVzxVSAPzdtgEgpRUGtImHj8/fs/riPjgvhdiGgn3QNQPI3i4iehttzd57nXF
 AGOt/iwUkMChhnszrrd8aN2qA9djp6g3WD4Scq6XtUHbTpRgDAUuAPQb2oAw8ooRv0s0
 N9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4y3TSxNQdi+jql86zSjoCm2QszJJK7xRnAAsAbT1tw=;
 b=OXriCg0qMjqBokMeplmlLfHYzOrlHjDz1eOQj7jy5Te3fvZJMDLmgPVtse4nos5uAO
 VL/+A0RXIYowTonqmG6ilaq2GX+IRvl46mrJl2Z18jwh0aLAWtCsegoP/58RHoZ3TDoR
 JBHBCPYIqgLxsqMFzC05PwgZ2yXftkgNWthYlJvoNQ4Ge8YFVDhaed5g3gQuD3Nx+YZm
 EwsNWMlaBJKMiSrMTWLTlUD332uwnq5WKm8PHLAvdVnCBlvBgKstZecS8S5z5IbzfCBz
 NB58j1oXljT6xI4L1RumAHRMEBRu2MVqiU/JxCmkLNQ+Mr3pYzteSn6UiwTPLyfa3fZS
 9RrA==
X-Gm-Message-State: AOAM530Z3qdDg4a/GFJMXTMS1G32tsiyMWvPkW2PA2/ZutC++5RXhetl
 MC6dJkDC2dlnIn7xfAI1EWr0nA==
X-Google-Smtp-Source: ABdhPJxnC2Q8HaMXHJaw7jk0dINvH8qTCMJCZD6BUXqe03VmXL/q+lfxtulZyZJZaRtH5kUn8Au8ng==
X-Received: by 2002:aca:49d0:: with SMTP id w199mr1614981oia.61.1611616840830; 
 Mon, 25 Jan 2021 15:20:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x141sm1807046oia.3.2021.01.25.15.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 15:20:40 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm ARM64 fixes for 5.11
Date: Mon, 25 Jan 2021 17:20:39 -0600
Message-ID: <20210125232039.642565-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_182046_039435_C5D79A80 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125232039.TO5JUaaC23Gv2OAZM9AKCTjWMql6t3rb7_YEVtjvcGI@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.11

for you to fetch changes up to 93f2a11580a9732c1d90f9e01a7e9facc825658f:

  arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc (2021-01-13 00:20:13 -0600)

----------------------------------------------------------------
Qualcomm ARM64 fixes for 5.11

This fixes a regression in Lenovo Yoga C630, where the touchpad in some
units stopped working, by re-enabling the "tsc2" device.

It also marks the LPASS related clocks as protected to allow DB845c and
the Lenovo Yoga C630 to boot even if CONFIG_SDM_LPASSCC_845 is enabled.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc

Shawn Guo (1):
      arm64: dts: qcom: c630: keep both touchpad devices enabled

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           |  4 +++-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 14 +++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
