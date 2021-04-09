Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28134C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 16:21:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B636461026
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 16:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B636461026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qj/rPSGVd5yIbVWaV3u3PAYveSR6KErh0kmr+fyrko8=; b=otlAPysYMzPBhnvv1JHQ4rnWOP
	4XbhGqelG4fBhoAVaHnkw4nSYGy6Uq9ktNDtq+mGJfMixMO97ZBT6ygm7oryR7L7eZ6aQcVVNcpqU
	OXBHeX40e6hgBKolBtqK0MLqwmxKZPNoct11h98X2QukzKmLjIU7b4uOBjvoS1IgFA0pUdicCVpq8
	OJsknjHA5W9L0xj3GkbYUQdDSR48/U+ugbfr2EZFt1xawhnXmDS3PRh+q9Jx0TsJAJWDtINHJJwQ1
	YFEAY3gF163VPLsscx5u1ZEih7dmaXj+8Rfs/HqSwHfffOqNPwcQLPbRoWFOUqH2zkPc5FAh2clNV
	iVJe3sYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUtrj-0015AE-BY; Fri, 09 Apr 2021 16:20:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUtrd-00159Q-OY
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 16:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zPSRX8zaxgtNoiiCZFNVozRTcGnADGai3Y004Te7wk0=; b=GfSbRO5fdHRVsIMydHtisVmSm7
 D4vwcUoug+4HoCDZQ5AEVYyI3VHzqzlmDkv/8f5kUHd9+VQ8YHEWeamEjVaQ9kLQ/es68mbH6pwNb
 CorCsJ/zp4GyrZk31zx9vroOAbB2Gl95o4bu4u3a6Gsh12FDcKGyGmVM+NLyDPHq1ga3e5tksJfqA
 /5fA14q6PMoBTSg4SAGTtHRfKnDJthPtHzvl39SVV3kw/8GSXU4f7a8DNywP0SHttZyzWT/voT6lI
 1F8XqG1S6KRQUE7ocDrzc1U7uaZw7wsm+iCTs7JeWELEK815Xiyi24BjdwMoTlMlwhujQNs5Wq7Xm
 WXt+f8gQ==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUtra-004eBD-VL
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 16:20:08 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 101-20020a9d0d6e0000b02902816815ff62so338457oti.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 09 Apr 2021 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zPSRX8zaxgtNoiiCZFNVozRTcGnADGai3Y004Te7wk0=;
 b=aVZpBRiKxfu6o8bbFEYy1QbykTLEAErhJvGuCGgjOX3Fa2GEwD26OMKFfc8NiMxtA3
 k2qp8MDK5mH4lQcx2rXxcAwcZZ9iZuMSE6s55NZs3EYvWxk3xqYdosBonhAsboVhQk1l
 vK7AG4OdJsZbJXeXrxE4Jhe8vnZOhrydv+yMeFdohKtekcWWCSZaWcZDFxcrPfuJcUT9
 SOw/jdFcwG6ypFIGJ4w7ODC5ednYlQCDiqgQ26Q/DBoGDJVoLiIqFOxZH5z1YLzpExop
 T7yicxidbYcFTjxVzS10SWgQq2Y+jwjvrf0Y1TxTw0zdl+CsErSQOkDZ1GY7uK7TqDxc
 0wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zPSRX8zaxgtNoiiCZFNVozRTcGnADGai3Y004Te7wk0=;
 b=k+97od8NjJ0IMnBxwlkae1xXmQDMjUZDkZ24PTdC8aVaZtv5nLcZU7q2VDpazh1keS
 A5JXVwDnf5/ecLEdRmEAgw4uNA0NZJsqYLF9SxTlTvJQNaLsOcHPaOnWdbB2tFH7e3Zv
 SJiEeheXBCKuG1Ug1ANZEDias+B/HbMMc6i4g0QGluo5XUMLiwQeviNvZMwBH/qDHmr7
 MpAZy0LhrrqvcD7pgD2i95vrivWze3h8zpebotN+Kxy2YsrC7A9OnUvNmhhmo3O/avEA
 9MtCnzv4uOVyUH35pze8ZOkF7cNKyb6kvup07HYRFLECNjwIkNjRg/J1ntvLxCrMykFM
 bFIQ==
X-Gm-Message-State: AOAM532WQxpCnAxwGMMYxY2y6t9R0IdornjCJSJfeB9MxN1uOy6PNP5Z
 VdBO5NAGsazaqYU0nYlvV1BYZg==
X-Google-Smtp-Source: ABdhPJyDIHwsloXBmHm5h0+dFlF4DCbzbUar8r1DMnB35mHiyaOrEdxe+e8jsdjUofCoC2sCmRqOWQ==
X-Received: by 2002:a9d:7288:: with SMTP id t8mr13278669otj.132.1617985203262; 
 Fri, 09 Apr 2021 09:20:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l71sm594235oib.30.2021.04.09.09.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 09:20:02 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Qinglang Miao <miaoqinglang@huawei.com>
Subject: [GIT PULL] More Qualcomm driver updates for 5.13
Date: Fri,  9 Apr 2021 11:20:01 -0500
Message-ID: <20210409162001.775851-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_092007_102001_587F492B 
X-CRM114-Status: GOOD (  12.81  )
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
Message-ID: <20210409162001.xBaznASCiRtgsuQEX5-vbnUcl3rZ0lwl6HNwYLuXKcc@z>

The following changes since commit ac6ad7c2a862d682bb584a4bc904d89fa7721af8:

  bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13-2

for you to fetch changes up to 0648c55e3a21ccd816e99b6600d6199fbf39d23a:

  soc: qcom: mdt_loader: Detect truncated read of segments (2021-04-08 10:28:59 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for 5.13

This improves the Qualcomm SCM driver logic related to detecting the
calling convention, in particular on SC7180, and fixes a few small
issues in the same.

It introduces additonal sanity checks of the size of loaded segments in
the MDT loader and adds a missing error in the return path of
pdr_register_listener().

It makes it possible to specify the OEM specific firmware path in the
wcn36xx control (and WiFi) driver.

Lastly it adds a missing path specifier in the MAINTAINERS' entry and
fixes a bunch of kerneldoc issues in various drivers.

----------------------------------------------------------------
Bjorn Andersson (5):
      dt-bindings: soc: qcom: wcnss: Add firmware-name property
      soc: qcom: wcnss_ctrl: Introduce local variable "dev"
      soc: qcom: wcnss_ctrl: Allow reading firmware-name from DT
      soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
      soc: qcom: mdt_loader: Detect truncated read of segments

Lukas Bulwahn (2):
      MAINTAINERS: add another entry for ARM/QUALCOMM SUPPORT
      soc: qcom: address kernel-doc warnings

Qinglang Miao (1):
      soc: qcom: pdr: Fix error return code in pdr_register_listener

Stephen Boyd (5):
      firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool
      firmware: qcom_scm: Reduce locking section for __get_convention()
      firmware: qcom_scm: Workaround lack of "is available" call on SC7180
      firmware: qcom_scm: Suppress sysfs bind attributes
      firmware: qcom_scm: Fix kernel-doc function names to match

 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    |  7 ++
 MAINTAINERS                                        |  1 +
 drivers/firmware/qcom_scm-legacy.c                 |  4 +-
 drivers/firmware/qcom_scm-smc.c                    | 12 +--
 drivers/firmware/qcom_scm.c                        | 89 ++++++++++++----------
 drivers/firmware/qcom_scm.h                        |  7 +-
 drivers/soc/qcom/mdt_loader.c                      | 17 +++++
 drivers/soc/qcom/pdr_interface.c                   |  2 +-
 drivers/soc/qcom/wcnss_ctrl.c                      | 15 ++--
 include/linux/soc/qcom/apr.h                       |  2 +-
 include/linux/soc/qcom/irq.h                       |  2 +-
 include/linux/soc/qcom/llcc-qcom.h                 |  6 +-
 include/linux/soc/qcom/qmi.h                       |  4 +-
 13 files changed, 107 insertions(+), 61 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
