Return-Path: <SRS0=86YY=JB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7340C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:00:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F9361368
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F9361368
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E3OfYOUZSW3J+JcF+2xo8YnLeyW4suJ24qO1IoweKhk=; b=IO1pHJ5XHKw01/SuoJCaFKysJl
	cXIWfca9VS/Xulla2MbQmv4nO5pkoJNDNHREJu/r5y+ASdkKxzD/xCUq50Nt5Kph3fZA/us4JxlLC
	tQhUhrrjgCl2Iq/F8o//HC08TkNDoiDiHHe3ziY5bPD3eRXfuz0bfiojH10+tGhsEDP5rlKd6hwSH
	lRMHENZiCUCxFmGz2XyTzm15wlMnO4UOazWKWvGhka96LbjJ/xDFuQtBQt31340gbh5fu91sEa2ji
	qKKAAt6GTbShkMWqwPRaAGEr5OgVbXHANHOTPpiInedTCObCfPHIBc1Wl4/67QtnuItY3ZOIiY9SI
	RQagSzhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lT575-00FvT5-Sc; Sun, 04 Apr 2021 15:56:59 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lT56e-00FvS5-Kn
 for linux-arm-kernel@lists.infradead.org; Sun, 04 Apr 2021 15:56:13 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so9322319otq.8
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 04 Apr 2021 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fbqTwDylyQbugrnO0aQEo4nKDcOq7w1OVDLL3nd4tOY=;
 b=izMvhpc1jRXqC7dJ9KVU9+snFnElat3KvdJSeLOkEbshx72AkDcQNZcVwpzfbQ6yhe
 KlMNIbun/WamNmPPEnTDnoazzQA5P7IsVp26Kic5NOatBCS7+DTwxLNA99ozkhgNy5Xh
 Ku/LO9Jl6nkpSjlTUq8ouQi5e5HGwHEMzBuqsB8M9u6CsBUec7Ee9pvc4lnvqxE4lBi+
 UJpCpIbl6vESIl5vJDmctkaL0EJxc8g4uVx1frR5/aYsRs+vj1ezfknwm2ocZF01dE/L
 2dXjxOtuAAUBmCZTCkWKunpvjSlTUX2lrcGT8b4/PHwKOWgrxsL+1iWXksbtfj61J6wQ
 U5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fbqTwDylyQbugrnO0aQEo4nKDcOq7w1OVDLL3nd4tOY=;
 b=H4i6VFupeXBj1zdMI2H4Eyg8WvOZrsdnKOJDpwPZ56F6er0XjInCaMalfVq+6/VCcF
 nqISS6Ovbq/Hr2izLtMxlx8ESVROtKghZuF555ywEPN4m1rrwoI4tWzeMg13pk4zrSSi
 Qv6dJ5wxJg62+loaSM9kCHJ9n29A8SdQBZNh+5aEV+AvP4hELU1iGMddc/lkBPtObVNj
 Bohp1yvJ2eojNFcapmO95R6bF+gRGoLnw19vNSkeP9K3kzddF9Ai4REU0/U2sEz8p3VR
 qbE3GphG6nzSPMYQatIWraqfaRGxc14lclKqgad9cI0dmEbCVwSNNesjO/73EqmqZYWF
 yg2Q==
X-Gm-Message-State: AOAM533UHUKCD5HRHnm2zkHdXbxmMjrAGgJx0sVzICxpZsK2G4eNkgg7
 cjh8uXmCPn3U+YvFBxVjcyCJeQ==
X-Google-Smtp-Source: ABdhPJyk6ebShuSTV1/Q5cVzDmoFP2NCnMoCHGwvY0MhfpEF3h+7b6/EUlW5vRxX6hA8hM4HAVl+fQ==
X-Received: by 2002:a9d:75c5:: with SMTP id c5mr18618113otl.334.1617551766232; 
 Sun, 04 Apr 2021 08:56:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id i4sm2609848oik.21.2021.04.04.08.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 08:56:05 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm fix for 5.12
Date: Sun,  4 Apr 2021 10:56:04 -0500
Message-ID: <20210404155604.712236-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_165611_697420_3CE837B7 
X-CRM114-Status: UNSURE (   7.30  )
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
Message-ID: <20210404155604.DhLxRN2i11tTBUMwLjfw7sQO3QH0OhbO6ZkPvlAauy0@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.12

for you to fetch changes up to 0c9fdcdba68208270ae85d39600ea97da1718344:

  soc: qcom: geni: shield geni_icc_get() for ACPI boot (2021-03-11 20:22:05 -0600)

----------------------------------------------------------------
Qualcomm fix for 5.12

This bypasses the, recently introduced, interconnect handling in the
GENI (serial engine) driver when running off ACPI, as this causes the
GENI probe to fail and the Lenovo Yoga C630 to boot without keyboard and
touchpad.

----------------------------------------------------------------
Shawn Guo (1):
      soc: qcom: geni: shield geni_icc_get() for ACPI boot

 drivers/soc/qcom/qcom-geni-se.c | 3 +++
 1 file changed, 3 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
