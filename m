Return-Path: <SRS0=5Wg8=LP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA50CC4743C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jun 2021 16:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B251E60200
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jun 2021 16:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B251E60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YkPbOQcXfOtf0AZvwNSvLXVf2I9RFL+KK9ZrqeOWTlw=; b=nnzZ6wAj6YPE9r
	1p6OFUglEj+jL559wvPV1YOVPyMYlzDZwGqmFjOqVcjsWi93YEjvcWil5xs93WSqrdjsWrya8xpZp
	qMFUixtgooVFtFZ/bDLi2cfIa+ZLOxxNCYkyPYmoFRXSkJMfW3q4nXpsug0nLIWFF3cbag6maBcR5
	O447Xm74AlZhICQEjWO/on1tKARWQ/J7P5t/sHuGPXxpA1Kj/F7aidS9TN2d3IOL7ECkC+Chkom4f
	8EpLlVH37Y0/RqLkrDMCyUlT1ybUbTUUtKADjPVw3zcBgoskaWvQcYOcRiXKCiTFXNNaqThsPXCbV
	a/wRKLIYigFhVjEHziHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvN7t-004BgG-4c; Mon, 21 Jun 2021 16:50:21 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvN7p-004BfE-9F
 for linux-arm-kernel@lists.infradead.org; Mon, 21 Jun 2021 16:50:18 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so18365140otk.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JCax5gzpRXFjKOT7fUvz8rzc/IG8uAiWNtIkm2nNbY=;
 b=Rn08BY9/tYgwbs9DDd8jLwNfj2gQyf4LDzySwhwTWXAbeKIP+wo18+4NObUz/okt6s
 NV/KlHs6rGvDguY4LJjdbXfskE6WEsFQR/XsX7r/KhOvz2pk+oS5FRnCpnICGmj3G1hV
 x2FY8fqhOJ/4m7S2os8EJw67MD9yvxveBcXngBNjSHzNU6g/Z6dRp1rEQoc0jLutvXeH
 g9R7sIlIbcH3flzX0bsGtHA33dwnUEeR6cwP/3lkVgH/AjvyH3NpJ+ljH0ajwLDz/KPp
 7f/qunNM0hserXrYdNjXrwxF0RyNN1EXCS4dk+iOOHnxvbk3JyVln2ceeR3njHfZRR1Y
 hxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JCax5gzpRXFjKOT7fUvz8rzc/IG8uAiWNtIkm2nNbY=;
 b=FJF4Rh8YJY40a5Ctf8RqeHqEDmXfbom+k8BZ4xzEmD0RxU/S9KiehhQ0hOcjx4zzor
 pimHpEmj3oZ+1gJUWbuO1lvgAyrwQlZb0VykmvQx6HjxwD/Z3+ghRlLsm6wanIRt+hvi
 5NLEZQxMNQs/7k3XytGsxCxjYS/vC2h3/Qfg8LRzwPhMil8xNoDp3S2q3s0KzS7Mh/3+
 95HBdkQhCr2bY2uAexgl7QCDM+XuiH6FquGzNhO5RebPBy8Rbs3eVgc9pthhfk+RWZVB
 7YPTWcNY4rwTHRZgI8M33mTHcMvdPE9R3yoRsEjKUKAQQlySFJADy/3QrLzub4jwFABT
 W4MQ==
X-Gm-Message-State: AOAM530R8qFpYL+Yif9m9RRHlXQMTqL9naiKC26OKM3wVYdwrDp6lcuJ
 WMXIYnSV+cOUm94QwgWEgbW0LQ==
X-Google-Smtp-Source: ABdhPJyvKQhJHOmA0cSNzv4OzqARvZ+VxAzloXXJh95f6t6nKTRaotVwmPFGPRaJkBxjih1bg71zhw==
X-Received: by 2002:a9d:346:: with SMTP id 64mr21834506otv.320.1624294216372; 
 Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id o6sm3115098ote.81.2021.06.21.09.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Additional Qualcomm ARM64 defconfig udpate for v5.14
Date: Mon, 21 Jun 2021 11:50:15 -0500
Message-ID: <20210621165015.943060-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_095017_370072_0DD4B770 
X-CRM114-Status: UNSURE (   7.71  )
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
Message-ID: <20210621165015.IaF5cc592nL_wf_RiHFsyP9TmQ55qG7QPFjtFMByxAI@z>

The following changes since commit e9cd414c1136aa31d34acc04c175bfaca4662f89:

  arm64: defconfig: add drivers needed for DragonBoard410c (2021-06-14 16:59:27 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14-1

for you to fetch changes up to 8ae030c34dce4f5764e945b325e8dc4d2adef044:

  arm64: defconfig: Enable renesas usb xhci pci host controller (2021-06-15 19:19:58 -0500)

----------------------------------------------------------------
Additional Qualcomm ARM64 defconfig udpate for v5.14

The Qualcomm Robotics RB3 Development Kit has a Renesas USB HUB on one
of the PCIe busses, which requires the releated driver to be enabled to
provide functional Ethernet and additional USB host ports.

----------------------------------------------------------------
Vinod Koul (1):
      arm64: defconfig: Enable renesas usb xhci pci host controller

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
