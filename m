Return-Path: <SRS0=Swux=L4=intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC362C04FFE
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E50BC2BD11; Tue, 23 Apr 2024 16:33:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF68EC2BD10;
	Tue, 23 Apr 2024 16:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF68EC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713890008; x=1745426008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tRGQG5FghnJATiUYNfgyrKU7BwzcbgnGZFG9lrAPHIo=;
  b=Lcw2hnykp1vcmJ/HcgSBw7O78iHJIxHrBXx9yr03T7HUsSiN0tZWO99I
   0xyVwEKEd4Zwtwb5+PQ8lTCa3whihP61PXS4PHtm/kU6C1Wikv7PZVoNe
   q5Y0ob43EoCm/92hJeqJ+6r7KKR5CrUlyNeZa0MgmWKn7raqrROtwGBB6
   8oGCwkPW60V5Ij3R8XibmHZ1yU66213Epjul1mp2N0vn6qgw47PfIwwvO
   VfPGqUldcce5ycwlx/Y4n4elzkuf97LZ+mz/5kPymiTVYjN2ye3BMrdOM
   xsWvrYXaVjo67XZCLsGC6p3fznRensi8N48ffVLzP/D2nZ7QUBY+Xy3jX
   w==;
X-CSE-ConnectionGUID: ecMahR8eRByZe+YUEYbfHA==
X-CSE-MsgGUID: jJH1/XNJRr6t6Ncjz/61rA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20181361"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20181361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:33:26 -0700
X-CSE-ConnectionGUID: q/OuY3sZRkyYeLL5IYrvCw==
X-CSE-MsgGUID: JGT6A6NmQoyU1LQiw0lOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28880060"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:33:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rzJ56-00000000Odt-3Z6Z;
	Tue, 23 Apr 2024 19:33:20 +0300
Date: Tue, 23 Apr 2024 19:33:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, arm@kernel.org
Subject: Re: [PATCH v6 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <Zifi0Iw8iVNvhptE@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-9-kabel@kernel.org>
 <ZifbjfBg0lBRkpoS@smile.fi.intel.com>
 <20240423182014.7ae8cdc3@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423182014.7ae8cdc3@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 23, 2024 at 06:20:14PM +0200, Marek Behún wrote:
> On Tue, 23 Apr 2024 19:02:21 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Thu, Apr 18, 2024 at 02:11:13PM +0200, Marek Behún wrote:

...

> > > +static inline struct dentry *
> > > +devm_debugfs_create_dir(struct device *dev, const char *name,
> > > +			struct dentry *parent)
> > > +{
> > > +	struct dentry *dentry;
> > > +	int err;  
> > 
> > > +	dentry = debugfs_create_dir(name, parent);
> > > +	if (IS_ERR(dentry))
> > > +		return dentry;  
> > 
> > Why do we care?
> > 
> > > +	err = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> > > +				       dentry);
> > > +	if (err < 0)
> > > +		return ERR_PTR(err);
> > > +
> > > +	return dentry;
> > > +}  
> > 
> > static inline struct dentry *
> > devm_debugfs_create_dir(struct device *dev, const char *name, struct dentry *parent)
> > {
> > 	struct dentry *dentry;
> > 	int err;
> > 
> > 	dentry = debugfs_create_dir(name, parent);
> > 
> > 	err = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop, dentry);
> > 	if (err)
> > 		return ERR_PTR(err);
> 
> But if the dir creation fails, there is no need to allocate devm
> destructor...

Yes, but why do we care about that?
debugfs is designed the way that we should ignore errors from it.

This discussion let me think, that probably the best solution is to add a field
to struct device_driver to handle this.

debugfs will appear only when device is completely instantiated, removed before
anything, and a lot of other benefits (see the story behind dev_groups as a
reference).

-- 
With Best Regards,
Andy Shevchenko


